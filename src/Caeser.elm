module Caeser exposing (..)

import Basics exposing (..)
import Char exposing (Char)


getBase : Char -> Int
getBase c =
    if Char.isUpper c then
        Char.toCode 'A'

    else
        Char.toCode 'a'


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


encode : Int -> String -> String
encode offset message =
    case String.uncons message of
        Nothing ->
            ""

        Just ( char, rest ) ->
            let
                base =
                    getBase char

                val =
                    Char.toCode char
            in
            if Char.isAlpha char then
                String.cons (Char.fromCode (modBy 26 (val - base + offset) + base)) (encode offset rest)

            else
                String.cons char (encode offset rest)


decode : Int -> String -> String
decode offset message =
    encode -offset message
