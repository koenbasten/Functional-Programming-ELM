module Clock exposing (..)


move : Int -> ( Int, Int ) -> ( Int, Int )



move input ( h, m ) =
    let
        totalWholeNewHours =
            if ((60 * h) + (m + input)) < 0 then
                modBy 24 (23 + (((60 * h) + (m + input)) // 60))

            else
                modBy 24 (((60 * h) + (m + input)) // 60)

        totalRestingMinutes =
            if modBy 60 (m + input) < 0 then
                60 + modBy 60 (m + input)

            else
                modBy 60 (m + input)
    in
    ( totalWholeNewHours, totalRestingMinutes )



-- modBy 24 (h + ((m + input) // 60)
