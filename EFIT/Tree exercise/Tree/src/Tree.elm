module Tree exposing (..)


type Tree a
    = Leaf a
    | Node (Tree a) (Tree a)


frontier : Tree a -> List a
frontier tr =
    case tr of
        Leaf a ->
            List.singleton a

        Node le ri ->
            List.concat [ frontier le, frontier ri ]


mirror : Tree a -> Tree a
mirror tr =
    case tr of
        Leaf a ->
            Leaf a

        Node le ri ->
            Node (mirror ri) (mirror le)



-- Definition of 'mirror'...
