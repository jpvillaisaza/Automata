-- | Two-way deterministic finite automata
module Automata.Data.TDFA
  ( TDFA(MkTDFA, delta, initial, states, symbols, finals)
  , Way(L,R,S)
  )
where

import Data.Set ( Set )

-- | A way.
data Way = L -- ^ Left
         | R -- ^ Right
         | S -- ^ Stay

-- | A two-way deterministic finite automaton (2DFA).
data TDFA state symbol =
  MkTDFA { states  :: Set state                       -- ^ States
         , symbols :: Set symbol                      -- ^ Input symbols
         , delta   :: state -> symbol -> (state, Way) -- ^ Transition function
         , initial :: state                           -- ^ Initial set
         , finals  :: Set state                       -- ^ Final states
         }
