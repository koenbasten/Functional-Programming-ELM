module Question4 exposing (..)


t0 =
    Nil


t1 =
    Node Nil (Leaf 13)


t2 =
    Node t1 (Node (Leaf 13) (Leaf 42))


t3 =
    Node (Node (Leaf 42) (Leaf 42)) t2


type BLT
    = Nil
    | Leaf Int
    | Node BLT BLT


toString : BLT -> String
toString tree =
    case tree of
        Nil ->
            "X"

        Leaf num ->
            String.fromInt num

        Node left right ->
            "(" ++ toString left ++ " " ++ toString right ++ ")"


remove : Int -> BLT -> BLT
remove target tree =
    case tree of
        Nil ->
            tree

        Leaf num ->
            if num == target then
                Nil

            else
                tree

        Node left right ->
            Node (remove target left) (remove target right)


prune : BLT -> BLT
prune tree =
    case tree of
        Nil ->
            Nil

        Leaf _ ->
            tree

        Node left right ->
            if (left == Nil) && (right == Nil) then
                Nil

            else
                prune (Node (prune left) (prune right))
