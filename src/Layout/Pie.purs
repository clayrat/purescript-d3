module Graphics.D3.Layout.Pie
  ( PieLayout()
  , pieLayout
  , padAngle
  , pie
  ) where

import Control.Monad.Eff
import Data.Foreign
import Data.Foreign.EasyFFI

import Graphics.D3.Base

ffi = unsafeForeignFunction

foreign import data PieLayout :: *

foreign import pieLayout :: D3Eff PieLayout

type ArcDescriptor = { data :: Number, value :: Number, startAngle:: Number, endAngle :: Number, padAngle :: Number }

padAngle :: Number -> PieLayout -> D3Eff PieLayout
padAngle = ffi ["angle", "pie", ""] "pie.padAngle(angle)"

pie :: Array Number -> PieLayout -> D3Eff (Array ArcDescriptor)
pie = ffi ["values", "pie", ""] "pie(values)"
