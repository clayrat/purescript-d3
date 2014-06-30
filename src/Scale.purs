module Graphics.D3.Scale
  ( LinearScale()
  , linearScale
  , domain
  , range
  , freeze
  ) where

import Graphics.D3.Base

-- A base class for all scale types
class Scale s

-- Linear scale
foreign import data LinearScale :: *
foreign import linearScale
  "var linearScale = d3.scale.linear"
  :: forall e. D3Eff e LinearScale
instance scaleLinear :: Scale LinearScale

foreign import domain
  "function domain(dict) {\
  \  return function (array) {\
  \    return function (scale) {\
  \      return function () {\
  \        return scale.domain(array);\
  \      };\
  \    };\
  \  };\
  \}"
  :: forall s a e. (Scale s) => [a] -> s -> D3Eff e LinearScale

foreign import range
  "function range(dict) {\
  \  return function (array) {\
  \    return function (scale) {\
  \      return function () {\
  \        return scale.range(array);\
  \      };\
  \    };\
  \  };\
  \}"
  :: forall s a e. (Scale s) => [a] -> s -> D3Eff e LinearScale

foreign import freeze
  "function freeze(dict) {\
  \  return function (scale) {\
  \    return function () {\
  \      return scale.copy();\
  \    };\
  \  };\
  \}"
  :: forall s e. (Scale s) => s -> D3Eff e (Number -> Number)
