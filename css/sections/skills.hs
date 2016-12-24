{-# LANGUAGE OverloadedStrings #-}
import Clay
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Colors

main :: IO ()
main = putCss $ "#skills" ? do
  background (url "../../images/backgrounds/skills.jpg")
  backgroundSize cover
  color white
  textAlign (alignSide sideCenter)
  before & Colors.dim
  ".section-title" ? color white
  h2 ?
    do color white
       fontSize (px 35)
       margin (px 22) nil (px 30) auto
  "text" ?
    do fontFamily ["Lato"] [sansSerif]
       fontSize (px 17)
       fontWeight (weight 400)
       "fill" -: "black"
       letterSpacing (px 2)
  ".axis" ? display none
