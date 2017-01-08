{-# LANGUAGE OverloadedStrings #-}
module Utils where

import Clay hiding (border)
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Data.Text
import Colors

border :: Size Abs -> Stroke -> Color -> Css
border width style color = do
  borderWidth width
  borderStyle style
  borderColor color

icon :: Selector -> Color -> Css
icon selector color =
  selector ? hover &
    do background color
       border (px 1) solid color

chart :: String -> Css
chart section =
  element (pack ("#" ++ section)) ? do
    backgroundSize cover
    color white
    textAlign (alignSide sideCenter)
    before & Colors.dim
    ".section-title" ? color white
    h2 ?
      do color white
         fontSize (px 30)
         margin (px 20) nil (px 20) auto
    "text" ?
      do fontSize (px 13)
         fontWeight (weight 400)
         "fill" -: "black"
         letterSpacing (px 2)
    ".axis" ? display none
