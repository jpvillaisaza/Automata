-- | Examples of two-way deterministic finite automata
module Automata.Data.TDFA.Examples where

import Automata.Data.TDFA

import Data.Set

data StateM = Q0 | Q1 deriving (Eq, Ord)

data SymbolM = A | B deriving (Eq, Ord)

-- | Example 1.
m :: TDFA StateM SymbolM
m = MkTDFA
    (fromList [Q0, Q1])
    (fromList [A, B])
    delta
    Q0
    (singleton Q1)
  where
    delta :: StateM -> SymbolM -> (StateM, Way)
    delta Q0 A = (Q0, R)
    delta Q0 B = (Q1, S)
    delta Q1 A = (Q0, L)
    delta Q1 B = (Q0, L)
