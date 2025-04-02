module QuestionD exposing (..)


type Expression
    = Plus Expression Expression
    | Minus Expression Expression
    | Mult Expression Expression
    | Fact Expression
    | Val Int


toString : Expression -> String
toString express =
    case express of
        Plus left right ->
            "(" ++ toString left ++ " + " ++ toString right ++ ")"

        Minus left right ->
            "(" ++ toString left ++ " - " ++ toString right ++ ")"

        Mult left right ->
            "(" ++ toString left ++ " * " ++ toString right ++ ")"

        Fact num ->
            toString num ++ "!"

        Val num ->
            String.fromInt num


eval : Expression -> Int
eval express =
    case express of
        Plus left right ->
            eval left + eval right

        Minus left right ->
            eval left - eval right

        Mult left right ->
            eval left * eval right

        Fact num ->
            case num of
                Val int ->
                    if int <= 0 then
                        1

                    else
                        int * eval (Fact (Val (int - 1)))

                _ ->
                    eval num

        Val num ->
            num



-- x * fact(x-1) for x > 0 1 for x <= 0
