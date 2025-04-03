
module TestsQuestionC exposing (..)


-- You do not need to modify anything in this module...

import QuestionC exposing (..)

testsImage: List Bool
testsImage = [testIA, testIB, testIC]

testsReport1: List Bool
testsReport1 = [testR1A, testR1B, testR1C]

testsReport2: List Bool
testsReport2 = [testR2A, testR2B, testR2C]

testsQuestionC: List Bool
testsQuestionC =  List.concat [testsImage, testsReport1, testsReport2]

-- Tests for 'image'...

aRelation: List (Char, Int)
aRelation = [ ('A', 3), ('A', 7), ('C', 3), ('A', 4), ('D', 1) ]

testIA: Bool
testIA = (image aRelation 'A' == [3, 7, 4])

testIB: Bool
testIB = (image aRelation 'B' == [])

testIC: Bool
testIC = (image aRelation 'C' == [3])

-- Tests for 'travelReport1' and 'travelReport2'...

allFlights: List (String, String)
allFlights = [ ("Amsterdam", "Hamburg"), ("Amsterdam", "Berlin"),
               ("Eindhoven", "Berlin"), ("Eindhoven", "Munich"),
               ("Hamburg", "Amsterdam"), ("Hamburg", "Warsaw"),
               ("Berlin", "Warsaw"), ("Berlin", "Bucharest"),
               ("Berlin", "Munich"), ("Munich", "Sofia") ]

testR1A: Bool
testR1A = equivalentReport
              (travelReport1 allFlights "Amsterdam")
              ("Amsterdam", 2, ["Hamburg", "Berlin"])

testR1B: Bool
testR1B = equivalentReport
              (travelReport1 allFlights "Berlin")
              ("Berlin", 3, ["Warsaw", "Bucharest", "Munich"])

testR1C: Bool
testR1C = equivalentReport
              (travelReport1 allFlights "Munich")
              ("Munich", 1, ["Sofia"])

testR2A: Bool
testR2A = equivalentReport
              (travelReport2 allFlights "Amsterdam")
              ("Amsterdam", 3, ["Warsaw", "Bucharest", "Munich"])

testR2B: Bool
testR2B = equivalentReport
              (travelReport2 allFlights "Berlin")
              ("Berlin", 1, ["Sofia"])

testR2C: Bool
testR2C = equivalentReport
              (travelReport2 allFlights "Munich")
              ("Munich", 0, [])

equivalentReport (city0, number0, destList) (city1, number1, destSet) =
    (city0 == city1) &&
    (number0 == number1) &&
    equalToSet destList destSet

equalToSet list set =
    (List.length list == List.length set) &&
    (List.all (\e -> List.member e list) set)
