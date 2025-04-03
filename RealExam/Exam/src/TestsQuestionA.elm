
module TestsQuestionA exposing (..)


-- You do not need to modify anything in this module...

import QuestionA exposing (..)

testHMTA: Bool
testHMTA = (howManyTimes 'a' ['b', 'a', 'b', 'e', 'l'] == 1)

testHMTB: Bool
testHMTB = (howManyTimes 'b' ['b', 'a', 'b', 'e', 'l'] == 2)

testHMTC: Bool
testHMTC = (howManyTimes 'c' ['b', 'a', 'b', 'e', 'l'] == 0)

testsQuestionA: List Bool
testsQuestionA = [testHMTA, testHMTB, testHMTC]
