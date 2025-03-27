module Tests exposing (..)

import Clock exposing (..)


testAP: Bool
testAP = (move 30 (8, 45) == (9, 15))

testBP: Bool
testBP = (move 45 (23, 40) == (0, 25))

testCP: Bool
testCP = (move 185 (22, 40) == (1, 45))

testDP: Bool
testDP = (move 2885 (8, 45) == (8, 50))

testAN: Bool
testAN = (move -30 (9, 15) == (8, 45))

testBN: Bool
testBN = (move -45 (0, 25) == (23, 40))

testCN: Bool
testCN = (move -185 (1, 45) == (22, 40))

testDN: Bool
testDN = (move -2885 (8, 50) == (8, 45))

allTests: List Bool
allTests =
    [
        testAP, testBP, testCP, testDP,
        testAN, testBN, testCN, testDN
    ]
