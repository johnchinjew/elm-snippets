module Id exposing (Id, random)

import Random


type alias Id =
    Int


random : Random.Generator Id
random =
    Random.int Random.minInt Random.maxInt
