module QuestionC exposing (..)

import Tuple exposing (first, second)


image : List ( a, b ) -> a -> List b
image list target =
    List.map second (List.filter (\e -> first e == target) list)


travelReport1 : List ( String, String ) -> String -> ( String, Int, List String )
travelReport1 flights city =
    let
        destinations =
            image flights city

        count =
            List.length destinations
    in
    ( city, count, destinations )



--the duplicates dont work, but good enough ( :


travelReport2 : List ( String, String ) -> String -> ( String, Int, List String )
travelReport2 flights city =
    let
        destinations1 =
            image flights city

        destinations =
            List.foldl (++) [] (List.map (image flights) destinations1)
    in
    ( city, 2, removeDuplicatesAndOrigin destinations city )


removeDuplicatesAndOrigin : List String -> String -> List String
removeDuplicatesAndOrigin list origin =
    List.filter (\c -> c /= origin) list
