module Graphics.D3.Layout.Pie
  ( PieLayout()
  , pieLayout
  , padAngle
  , pie
  , noSort
  , value
  ) where

import Control.Monad.Eff
import Data.Foreign
import Data.Foreign.EasyFFI

import Graphics.D3.SVG.Shape (ArcDescriptor())
import Graphics.D3.Base

ffi = unsafeForeignFunction

foreign import data PieLayout :: *

foreign import pieLayout :: D3Eff PieLayout

padAngle :: Number -> PieLayout -> D3Eff PieLayout
padAngle = ffi ["angle", "pie", ""] "pie.padAngle(angle)"

pie :: forall d. Array d -> PieLayout -> D3Eff (Array (ArcDescriptor d))
pie = ffi ["values", "pie", ""] "pie(values)"

noSort :: PieLayout -> D3Eff PieLayout
noSort = ffi ["pie", ""] "pie.sort(null)"

value :: forall d. (d -> Number) -> PieLayout -> D3Eff PieLayout
value = ffi ["accessor", "pie", ""] "pie.value(accessor)"
