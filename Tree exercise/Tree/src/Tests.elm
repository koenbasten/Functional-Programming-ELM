
module Tests exposing (..)


-- You do not need to modify anything in this module...

import Tree exposing (..)

aTree: Tree Int
aTree = Node (Leaf 1) (Node (Node (Leaf 3) (Leaf 5)) (Leaf 7))

testF: Bool
testF = (frontier aTree == [1, 3, 5, 7])

testM: Bool
testM = (frontier (mirror aTree) == [7, 5, 3, 1])

allTests: List Bool
allTests = [testF, testM]
