{-# LANGUAGE OverloadedStrings #-}
module Utils where

import Clay hiding (border)

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
