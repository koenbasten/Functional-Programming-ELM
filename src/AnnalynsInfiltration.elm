module AnnalynsInfiltration exposing (..)

-- TODO: please define a type alias for the 'Coach' record
-- TODO: please define the 'Stats' record
-- TODO: please define the 'Team' record


type alias Coach =
    { name : String
    , formerPlayer : Bool
    }


type alias Stats =
    { wins : Int
    , losses : Int
    }


type alias Team =
    { name : String
    , coach : Coach
    , stats : Stats
    }


replaceCoach newCoach team =
    Debug.todo "Please implement this function"


createTeam : String -> Stats -> Coach -> Team
createTeam name stats coach =
    



-- TODO: use an extensible record to accept any record that has a `stats: Stats` field
-- TODO: use pattern matching in the function parameter to get the `stats` field from the record


rootForTeam team =
    Debug.todo "Please implement this function, try to pattern match in the function parameter"
