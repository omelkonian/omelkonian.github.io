{-# LANGUAGE OverloadedStrings #-}
import Clay
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Colors

main :: IO ()
main = putCss $ "#interests" ? do
  background (url "../../images/backgrounds/trees.jpg")
  backgroundSize cover
  color black
  textAlign (alignSide sideCenter)
  before & Colors.dim
  ".section-title" ? color white
  ".black" ? color black
  ".white" ? color white
  h2 ?
    do fontSize (px 30)
       margin (px 22) nil (px 30) auto
       color white
  "circle" ?
    do "fill" -: "#f9c40a"
       "fill-opacity" -: ".40"
  ".leaf" ?
    do "circle" ?
          do "fill" -: "#1f8e0a"
             "fill-opacity" -: ".90"
       "text" ?
         do background transparent
            color white
            fontSize (px 11)
            letterSpacing (px 1)
            textTransform uppercase
            fontWeight (weight 500)
            "text-anchor" -: "middle"
