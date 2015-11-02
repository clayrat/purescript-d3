module Graphics.D3.Util
  ( Magnitude
  , min
  , max
  , min'
  , max'
  , extent
  , extent'
  , translateStr
  , range
  , (..)
  , (...)
  ) where

import Data.Foreign.EasyFFI
import Data.Date

import Prelude ( ($), (>>=), flip, (++), show )

ffi = unsafeForeignFunction

class Magnitude n

instance numberMagnitude :: Magnitude Number
instance dateMagnitude :: Magnitude JSDate

min' :: forall d m. (Magnitude m) => (d -> m) -> Array d -> m
min' = ffi ["fn", "data"] "d3.min(data, fn)"

max' :: forall d m. (Magnitude m) => (d -> m) -> Array d -> m
max' = ffi ["fn", "data"] "d3.max(data, fn)"

min :: forall m. (Magnitude m) => Array m -> m
min = ffi ["data"] "d3.min(data)"

max :: forall m. (Magnitude m) => Array m -> m
max = ffi ["data"] "d3.max(data)"

-- extent takes a data array and returns [min,max]
-- not restricted to Number, i.e. also works with time
extent :: forall m. (Magnitude m) => Array m -> Array m
extent = ffi ["data"] "d3.extent(data)"

extent' :: forall d m. (Magnitude m) => (d->m) -> Array d -> Array m
extent' = ffi ["fn", "data"] "d3.extent(data, fn)"

translateStr :: Number -> Number -> String
translateStr x y = "translate(" ++ show x ++ "," ++ show y ++ ")"

range :: Number -> Number -> Number -> Array Number
range = ffi ["start", "stop", "step"] "d3.range(start, stop, step)"

-- Syntactic sugar to make chained monadic statements look similar to the
-- "fluid interface" style of chained method calls in JavaScript
(..) = (>>=)

-- Reversed function application, useful for applying extended monadic chains
-- to already-obtained values
(...) = flip ($)
