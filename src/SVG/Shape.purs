module Graphics.D3.SVG.Shape
    ( Arc()
    , arc
    , ArcDescriptor()
    , outerRadius
    , innerRadius
    , padRadius
    , cornerRadius
    , startAngle'
    , endAngle'
    , centroid
    ) where

  import Data.Foreign.EasyFFI
  import Prelude hiding (append)

  import Graphics.D3.Base
  import Graphics.D3.Selection

  ffi = unsafeForeignFunction

  foreign import data Arc :: *

  foreign import arc :: D3Eff Arc

  instance attrValArc :: AttrValue Arc

  type ArcDescriptor d = { data :: d, value :: Number, startAngle:: Number, endAngle :: Number, padAngle :: Number }

  outerRadius :: Number -> Arc -> D3Eff Arc
  outerRadius = ffi ["radius", "arc", ""] "arc.outerRadius(radius)"

  innerRadius :: Number -> Arc -> D3Eff Arc
  innerRadius = ffi ["radius", "arc", ""] "arc.innerRadius(radius)"

  padRadius :: Number -> Arc -> D3Eff Arc
  padRadius = ffi ["radius", "arc", ""] "arc.padRadius(radius)"

  cornerRadius :: Number -> Arc -> D3Eff Arc
  cornerRadius = ffi ["radius", "arc", ""] "arc.cornerRadius(radius)"

  startAngle' :: forall d v. (d -> v) -> Arc -> D3Eff Arc
  startAngle' = ffi ["angle", "arc", ""] "arc.startAngle(angle)"

  endAngle' :: forall d v. (d -> v) -> Arc -> D3Eff Arc
  endAngle' = ffi ["angle", "arc", ""] "arc.endAngle(angle)"

  centroid :: forall v. ArcDescriptor v -> Arc -> String
  centroid = ffi ["d", "arc"] "arc.centroid(d)"
