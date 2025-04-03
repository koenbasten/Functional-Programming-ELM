
module TestsQuestionB exposing (..)


-- You do not need to modify anything in this module...

import QuestionB exposing (..)

testBAA: Bool
testBAA = (bitsA [True, True, False, True] == "1101")

testBAB: Bool
testBAB = (bitsA [False] == "0")

testBBA: Bool
testBBA = (bitsB [True, True, False, True] == "1101")

testBBB: Bool
testBBB = (bitsB [False] == "0")

testBCA: Bool
testBCA = (bitsC [True, True, False, True] == "1101")

testBCB: Bool
testBCB = (bitsC [False] == "0")

testsQuestionB: List Bool
testsQuestionB = [testBAA, testBAB, testBBA, testBBB, testBCA, testBCB]
