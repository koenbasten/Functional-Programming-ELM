module Caeser exposing (..)

import Basics exposing (..)
import Char exposing (Char)


getBase : Char -> Int
getBase c =
    if Char.isUpper c then
        Char.toCode 'A'

    else
        Char.toCode 'a'


encode : Int -> Char -> Char
encode offset c =
    let
        base =
            getBase c

        val =
            Char.toCode c
    in
    if Char.isAlpha c then
        Char.fromCode (modBy 26 (val - base + offset) + base)

    else
        c


decode : Int -> Char -> Char
decode offset c =
    encode -offset c


normalize : String -> String
normalize message =
    case String.uncons message of
        Nothing ->
            ""

        Just ( char, rest ) ->
            if Char.isAlpha char then
                String.cons char (normalize rest)

            else
                normalize rest
