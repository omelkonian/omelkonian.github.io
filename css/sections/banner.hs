{-# LANGUAGE OverloadedStrings #-}
import Clay hiding (border)
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Colors
import Utils (border)

main :: IO ()
main = putCss $
  do banner
     navbar

banner :: Css
banner = "#banner" ?
  do width (pct 100)
     ".banner" ? marginTop (px 100)
     background (url "../../images/backgrounds/banner-dark4.jpg")
     backgroundSize cover
     backgroundRepeat noRepeat
     position relative
     color white
     ".top-banner" ?
       do marginTop (px 50)
          "#menu" ? cursor pointer
     (".fa" <> ".fab" <> ".far" <> ".fas") ? hover & color Colors.basicGreen
     ".logo" ?
       do margin nil auto auto auto
          padding (px 10) (px 10) (px 10) (px 10)
          width (px 200)
          color white
          zIndex 99999
     ".banner" ?
       do margin (px 50) auto auto auto
          h1 ?
            do color Colors.basicGreen
               fontSize (px 42)
               fontWeight (weight 400)
               textTransform uppercase
          h2 ?
            do color white
               fontSize (px 35)
               margin (px 32) nil (px 50) auto
     ".btn-collapse" ?
       do (".fa" <> ".fab" <> ".far" <> ".fas") ? (hover & color white)
          a ? i ?
            do fontSize (px 45)
               width (px 68)
               height (px 68)


navbar :: Css
navbar = "#navigation" ? do
  background Colors.basicGreen
  border (px 1) solid Colors.basicGreen
  color white
  paddingTop (px 50)
  textAlign (alignSide sideCenter)
  width (px 400)
  zIndex 99999
  overflow hidden
  ".logo" ?
    do margin nil auto nil auto
       padding (px 30) (px 30) (px 30) (px 30)
       width (px 100)
  ".nav" ? li ?
    do border (px 1) solid transparent
       margin (px 10) (px 40) (px 10) (px 40)
       transition "border-color" (sec 0.3) easeInOut (sec 0)
       a ?
         do background transparent
            color white
            fontSize (px 16)
            fontWeight (weight 300)
            letterSpacing (px 2)
            textTransform uppercase
       hover & borderColor white
       ".active" & borderColor white
