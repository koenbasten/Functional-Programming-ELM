
module TestsQuestionD exposing (..)


-- You do not need to modify anything in this module...

import QuestionD exposing (..)

aTree: Huffman
aTree = Node (Node (Leaf 'a') (Node (Leaf 'h') (Leaf 'k'))) (Leaf 'e')

testH: Bool
testH = (height aTree == 3)

testDA: Bool
testDA = (decode aTree "00" == Just 'a')

testDB: Bool
testDB = (decode aTree "01" == Nothing)

testDC: Bool
testDC = (decode aTree "011" == Just 'k')

testDD: Bool
testDD = (decode aTree "0111" == Nothing)

testsQuestionD: List Bool
testsQuestionD = [ testH,  testDA, testDB, testDC, testDD ]
