module Graphics.D3.Color (
  hsl
  ) where

  import Data.Foreign.EasyFFI

  ffi = unsafeForeignFunction

  hsl :: Number -> Number -> Number -> String
  hsl = ffi ["h", "s", "l"] "d3.hsl(h,s,l)"
