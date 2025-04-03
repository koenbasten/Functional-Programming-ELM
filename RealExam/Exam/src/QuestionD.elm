module QuestionD exposing (..)


type Huffman
    = Leaf Char
    | Node Huffman Huffman


height : Huffman -> Int
height tree =
    case tree of
        Leaf _ ->
            0

        Node left right ->
            let
                leftCount =
                    1 + height left

                rightCount =
                    1 + height right
            in
            if leftCount < rightCount then
                rightCount

            else
                leftCount


decode : Huffman -> String -> Maybe Char
decode tree code =
    let
        codeList =
            String.toList code
    in
    case tree of
        Leaf c ->
            if String.isEmpty code then
                Just c

            else
                Nothing

        Node left right ->
            case codeList of
                [] ->
                    Nothing

                first :: rest ->
                    if first == '0' then
                        --do left
                        decode left (String.fromList rest)

                    else
                        --do right
                        decode right (String.fromList rest)
