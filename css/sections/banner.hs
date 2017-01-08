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
     backgroundImage (url "../../images/backgrounds/banner.jpg")
     backgroundSize cover
     backgroundRepeat noRepeat
     position relative
     color white
     before &
       do Colors.dim
          position absolute
          width (pct 100)
          height (pct 100)
          top (px 0)
          bottom (px 0)
          content (stringContent "")
          display block
     ".top-banner" ?
       do marginTop (px 50)
          "#menu" ? cursor pointer
     ".fa" ? hover & color Colors.basicGreen
     ".logo" ?
       do margin nil auto auto auto
          padding (px 10) (px 10) (px 10) (px 10)
          width (px 50)
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
               fontSize (px 45)
               margin (px 32) nil (px 50) auto
          ".scroll" ?
            do margin (px 50) nil (px 50) nil
               a ? i ?
                 do fontSize (px 48)
                    color Colors.basicGreen
                    padding (px 12) (px 12) (px 12) (px 12)
                    width (px 68)
                    height (px 68)
                    textAlign (alignSide sideCenter)
                    borderRadius (pct 50) (pct 50) (pct 50) (pct 50)
                    background white
                    transition "all" (sec 0.3) ease (sec 0)
                    hover &
                      do background Colors.basicGreen
                         color white


navbar :: Css
navbar = "#navigation" ? do
  background Colors.basicGreen
  border (px 1) solid Colors.basicGreen
  color white
  paddingTop (px 50)
  textAlign (alignSide sideCenter)
  width (px 300)
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
