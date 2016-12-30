{-# LANGUAGE OverloadedStrings #-}
-- import Clay (putCss)
-- import Utils (chart)
import Clay hiding (border)
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Data.Text
import Colors

main :: IO ()
main = -- putCss $ chart "grades"
  putCss $ ("#skills" <> "#grades") ? do
    background (url "../../images/backgrounds/skills.jpg")
    backgroundSize cover
    color white
    textAlign (alignSide sideCenter)
    before & Colors.dim
    ".section-title" ? color white
    h2 ?
      do color white
         fontSize (px 30)
         margin (px 20) nil (px 30) auto
    "text" ?
      do fontSize (px 13)
         fontWeight (weight 400)
         "fill" -: "black"
         letterSpacing (px 2)
    ".axis" ? display none
