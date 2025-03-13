module Repos exposing (..)


type Approval
    = Yes
    | No
    | Maybe


type Cuisine
    = Korean
    | Turkish


type Genre
    = Crime
    | Horror
    | Romance
    | Thriller


type Activity
    = Boardgame
    | Chill
    | Movie Genre
    | Restaurant Cuisine


rateActivity : Activity -> Approval
rateActivity activity =
    case activity of
        Boardgame ->
            No

        Chill ->
            No

        Movie Romance ->
            Yes

        Movie _ ->
            No

        Restaurant Korean ->
            Yes

        Restaurant Turkish ->
            Maybe
