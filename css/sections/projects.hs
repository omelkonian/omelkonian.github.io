{-# LANGUAGE OverloadedStrings #-}
import Clay hiding (border)
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Colors
import Utils (border)

main :: IO ()
main = putCss $ "#projects" ? do
  background (url "../../images/backgrounds/projects.jpg")
  backgroundSize cover
  color white
  before & Colors.dim
  ".section-title" ? color black
  blockquote ?
    do borderLeft none none none
       margin nil nil nil nil
  ".commant" ?
    do float floatLeft
       background (rgba 54 74 86 80)
       margin nil (px 90) nil (px 100)
       ".claint" ?
         do width (px 270)
            height (px 270)
            marginLeft (px (-15))
            position relative
       ".quote" ?
         do background white
            width (px 64)
            position absolute
            top (pct 12)
            right (px (-67))
            height (px 64)
            borderRadius (pct 50) (pct 50) (pct 50) (pct 50)
            textAlign (alignSide sideCenter)
            i ?
              do fontSize (px 30)
                 color green
                 lineHeight (px 65)
       ".carousel-indicators" ?
         do bottom (px (-50))
            li ?
              do borderRadius nil nil nil nil
                 border nil none none
                 backgroundColor white
            ".active" ?
              do backgroundColor green
                 border nil none none
       ".info" ?
         do padding (px 50) nil nil (px 100)
            p ?
              do fontSize (px 16)
                 color white
                 fontWeight (weight 400)
                 fontStyle italic
                 textAlign justify
                 paddingBottom (px 32)
            h4 ?
              do fontSize (px 22)
                 fontWeight (weight 700)
                 lineHeight (px 26)
                --  textTransform uppercase
            h5 ?
              do fontSize (px 16)
                 fontWeight (weight 700)
            h6 ?
              do fontSize (px 16)
                 fontWeight (weight 700)
                 color green
                 wordSpacing (px 10)
            a ?
              do position relative
                 color white
                 margin (px 0) (px 5) (px 0) (px 5)
                 left (px 400)
                 i ?
                   do fontSize (px 24)
                      width (px 28)
                      height (px 28)
                      textAlign (alignSide sideCenter)
                      lineHeight (px 28)
                      verticalAlign middle
                      transition "all" (sec 0.2) linear (sec 0)
                 ".fa-cloud" ? hover &
                   do background Colors.soundcloud
                      border (px 1) solid Colors.soundcloud
                 ".fa-bitbucket" ? hover &
                   do background Colors.bitbucket
                      border (px 1) solid Colors.bitbucket
                 ".fa-book" ? hover &
                   do background Colors.documentation
                      border (px 1) solid Colors.documentation
