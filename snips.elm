import Random

historicRandom : (Int -> Float) -> List ( Int, a ) -> Maybe (Random.Generator a)
historicRandom apply occurrences =
    case List.head occurrences of
        Nothing ->
            Nothing

        Just head ->
            let
                rest =
                    Maybe.withDefault [] (List.tail occurrences)

                weight : ( Int, a ) -> ( Float, a )
                weight occurence =
                    ( apply (Tuple.first occurence), Tuple.second occurence )
            in
            Just (Random.weighted (weight head) (List.map weight rest))
