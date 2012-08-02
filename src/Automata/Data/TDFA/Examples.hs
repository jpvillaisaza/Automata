-- | Examples of two-way deterministic finite automata
module Automata.Data.TDFA.Examples where

import Automata.Data.TDFA ( TDFA(MkTDFA), Way(L,R,S) )

import Data.Set ( fromList, singleton )

data StateM = Q0 | Q1 deriving (Eq, Ord)

data SymbolM = A | B deriving (Eq, Ord)

-- | Example 1.
m :: TDFA StateM SymbolM
m = MkTDFA
    (fromList [Q0, Q1])
    (fromList [A, B])
    deltaM
    Q0
    (singleton Q1)
  where
    deltaM :: StateM -> SymbolM -> (StateM, Way)
    deltaM Q0 A = (Q0, R)
    deltaM Q0 B = (Q1, S)
    deltaM Q1 A = (Q0, L)
    deltaM Q1 B = (Q0, L)
