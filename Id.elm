-- An opaque type and generator for core/random-based (32-bit, pseudo-random) Id's.


module Id exposing (Id, randomId)

import Random


type Id
    = Id Int


randomId : Random.Generator Id
randomId =
    Random.map Id (Random.int Random.minInt Random.maxInt)
