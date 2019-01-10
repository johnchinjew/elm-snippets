module Indexer exposing (Indexer(..))

import Array exposing (Array)


type Indexer a
    = Indexer (Array a) (List Int)


empty : Indexer a
empty =
    Indexer Array.empty []


push : a -> Indexer a -> ( Int, Indexer a )
push value indexer =
    case indexer of
        Indexer values removed ->
            case List.head removed of
                Just key ->
                    ( key
                    , Indexer (Array.set key value values) (Maybe.withDefault [] (List.tail removed))
                    )

                Nothing ->
                    ( Array.length values, Indexer (Array.push value values) removed )


set : Int -> a -> Indexer a -> Indexer a
set key value indexer =
    case indexer of
        Indexer values removed ->
            Indexer (Array.set key value values) removed


get : Int -> Indexer a -> Maybe a
get key indexer =
    case indexer of
        Indexer values _ ->
            Array.get key values


remove : Int -> Indexer a -> Indexer a
remove key indexer =
    case indexer of
        Indexer values removed ->
            Indexer values (key :: removed)


member : Int -> Indexer a -> Bool
member key indexer =
    case indexer of
        Indexer values removed ->
            not (List.member key removed) && key >= 0 && key < Array.length values
