module Caeser exposing (..)

--TODO Fix negative Offset

encode: Int -> Char -> Char
encode offset char =
    if (Char.isAlpha char) then 
        Char.fromCode((calcOffset (Char.toCode(char)) offset True))
    else
        char

decode: Int -> Char -> Char
decode offset char =
    if (Char.isAlpha char) then 
        Char.fromCode((calcOffset (Char.toCode(char)) offset False))
    else
        char

   
calcOffset: Int -> Int -> Bool -> Int
calcOffset charCode offset encodeBool= 
    if encodeBool then 
        if ( charCode + offset > 122) then 
                charCode + offset - 26
            else if (  charCode + offset > 90 && charCode <= 90) then
                charCode + offset - 26
            else 
                charCode + offset      
    else 
         if ( charCode - offset < 97 && charCode >= 97) then
                charCode - offset + 26
            else if (  charCode - offset < 65) then
                charCode - offset + 26
            else 
                charCode - offset
    
