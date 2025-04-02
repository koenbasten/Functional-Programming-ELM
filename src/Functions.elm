module Functions exposing (..)


type Function
    = Poly Function Int
    | Mult Function Function
    | Div Function Function
    | Plus Function Function
    | Minus Function Function
    | Const Int
    | X


print : Function -> String
print func =
    case func of
        Poly f n ->
            "(" ++ print f ++ " ^ " ++ String.fromInt n ++ ")"

        Mult f1 f2 ->
            "(" ++ print f1 ++ " * " ++ print f2 ++ ")"

        Div f1 f2 ->
            "(" ++ print f1 ++ " / " ++ print f2 ++ ")"

        Plus f1 f2 ->
            "(" ++ print f1 ++ " + " ++ print f2 ++ ")"

        Minus f1 f2 ->
            "(" ++ print f1 ++ " - " ++ print f2 ++ ")"

        Const n ->
            String.fromInt n

        X ->
            "x"


eval : Float -> Function -> Float
eval x func =
    let
        solve =
            eval x
    in
    case func of
        Poly f n ->
            solve f ^ toFloat n

        Mult f1 f2 ->
            solve f1 * solve f2

        Div f1 f2 ->
            solve f1 / solve f2

        Plus f1 f2 ->
            solve f1 + solve f2

        Minus f1 f2 ->
            solve f1 - solve f2

        Const n ->
            toFloat n

        X ->
            x


graph : Function -> Int -> Int -> Int -> Int -> String
graph func xmin xmax ymin ymax =
    if xmin > xmax then
        ""

    else
        let
            result =
                eval (toFloat xmin) func

            roundedResult =
                round result
        in
        if roundedResult > ymax || roundedResult < ymin then
            String.repeat (ymax - ymin) "*" ++ "\n" ++ graph func (xmin + 1) xmax ymin ymax

        else
            let
                stars =
                    String.repeat (roundedResult - ymin) "*"

                dashes =
                    String.repeat (ymax - roundedResult) "-"
            in
            stars ++ dashes ++ "\n" ++ graph func (xmin + 1) xmax ymin ymax


simplify : Function -> Function
simplify func =
    case func of
        Plus f (Const 0) ->
            simplify f

        Plus (Const 0) f ->
            simplify f

        Plus f1 f2 ->
            let
                s1 =
                    simplify f1

                s2 =
                    simplify f2
            in
            if s1 == s2 then
                Mult (Const 2) s1

            else
                Plus s1 s2

        Mult f (Const 1) ->
            simplify f

        Mult (Const 1) f ->
            simplify f

        Mult _ (Const 0) ->
            Const 0

        Mult (Const 0) _ ->
            Const 0

        Mult f1 f2 ->
            let
                s1 =
                    simplify f1

                s2 =
                    simplify f2
            in
            Mult s1 s2

        Div f (Const 1) ->
            simplify f

        Div f1 f2 ->
            Div (simplify f1) (simplify f2)

        Poly f 1 ->
            simplify f

        Poly _ 0 ->
            Const 1

        Poly f n ->
            Poly (simplify f) n

        Minus f (Const 0) ->
            simplify f

        Minus f1 f2 ->
            Minus (simplify f1) (simplify f2)

        Const n ->
            Const n

        X ->
            X


derivative : Function -> Function
derivative func =
    case func of
        Const _ ->
            Const 0

        X ->
            Const 1

        Plus f1 f2 ->
            Plus (derivative f1) (derivative f2)

        Minus f1 f2 ->
            Minus (derivative f1) (derivative f2)

        Mult f1 f2 ->
            Plus (Mult (derivative f1) f2) (Mult f1 (derivative f2))

        --product regel
        Div f1 f2 ->
            --quotient regel
            Div
                (Minus (Mult (derivative f1) f2) (Mult f1 (derivative f2)))
                (Poly f2 2)

        Poly f n ->
            Mult (Const n) (Mult (Poly f (n - 1)) (derivative f))



--ketting regel
