module PipeOperator exposing (..)


test1 : Int -> Int
test1 number =
    number
        |> toFloat
        |> sqrt
        |> round


test2 : Int -> Int
test2 number =
    round (sqrt (toFloat number))
