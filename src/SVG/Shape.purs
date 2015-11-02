module Graphics.D3.SVG.Shape
  ( Arc(),
    arc,
    outerRadius,
    innerRadius,
    cornerRadius,
    startAngle',
    endAngle'
  ) where

  import Graphics.D3.Base
  import Graphics.D3.Selection
  import Data.Foreign.EasyFFI

  ffi = unsafeForeignFunction

  foreign import data Arc :: *

  foreign import arc :: D3Eff Arc

  instance attrValArc :: AttrValue Arc

  outerRadius :: Number -> Arc -> D3Eff Arc
  outerRadius = ffi ["radius", "arc", ""] "arc.outerRadius(radius)"

  innerRadius :: Number -> Arc -> D3Eff Arc
  innerRadius = ffi ["radius", "arc", ""] "arc.innerRadius(radius)"

  cornerRadius :: Number -> Arc -> D3Eff Arc
  cornerRadius = ffi ["radius", "arc", ""] "arc.cornerRadius(radius)"

  startAngle' :: forall d v. (d -> v) -> Arc -> D3Eff Arc
  startAngle' = ffi ["angle", "arc", ""] "arc.startAngle(angle)"

  endAngle' :: forall d v. (d -> v) -> Arc -> D3Eff Arc
  endAngle' = ffi ["angle", "arc", ""] "arc.endAngle(angle)"
