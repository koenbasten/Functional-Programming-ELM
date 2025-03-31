module QuestionD exposing (..)


type Huffman
    = Leaf Char
    | Node Huffman Huffman


ht =
    Node (Node (Leaf 'a') (Node (Leaf 'h') (Leaf 'k'))) (Leaf 'e')


alphabet : Huffman -> List Char
alphabet tree =
    case tree of
        Leaf c ->
            [ c ]

        Node left right ->
            alphabet left ++ alphabet right


code : Huffman -> Char -> Maybe String
code tree search =
    case tree of
        Leaf c ->
            if c == search then
                --if it is equal to return empty Just
                Just ""

            else
                Nothing

        Node right left ->
            case code left search of
                Nothing ->
                    -- if left does not contain
                    case code right search of
                        Nothing ->
                            -- if right does not contain
                            Nothing

                        Just string ->
                            -- if left does contain
                            Just ("0" ++ string)

                Just string ->
                    -- if right does contain
                    Just ("1" ++ string)
