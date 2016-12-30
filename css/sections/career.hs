{-# LANGUAGE OverloadedStrings #-}
import Clay hiding (border, table)
import Clay.Display (table)
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Colors
import Utils (border)

main :: IO ()
main = putCss $
  do career
    --  timeline

career :: Css
career = "#career" ?
  do background (url "../../images/backgrounds/career.jpg")
     backgroundSize cover
     color black
     textAlign (alignSide sideCenter)
     before & Colors.dim
     ".section-title" ? color white --black
     ".table" ?
       do display table
          margin nil auto nil auto

timeline :: Css
timeline = "ul.timeline" ?
  do padding (px 20) nil (px 20) nil
     position relative
     before &
       do top nil
          bottom nil
          position absolute
          content (stringContent "")
          width (px 3)
          backgroundColor Colors.lightGreen
          left (pct 50)
          marginLeft (px (-2))
     ".tldate" ?
       do display block
          width (px 200)
          background Colors.darkGray
          color Colors.lightGray
          margin nil auto nil auto
          padding (px 3) nil (px 3) nil
          fontWeight bold
          textAlign (alignSide sideCenter)
          boxShadow nil nil (px 11) (rgba 0 0 0 100) -- 0.35
     ".tl-heading" ? h4 ?
       do margin nil nil (px 30) nil
          color Colors.darkGreen
     ".tl-body" ? li ?
       do fontSize (px 16)
          float floatLeft
          ".emph" ? fontWeight (weight 600)
     li ?
       do marginBottom (px 25)
          position relative
          (":before" <> ":after") ?
            do content (stringContent "")
               display table
          after & clear both
          ".tl-circ" ?
            do position absolute
               top (px 23)
               left (pct 50)
               textAlign (alignSide sideCenter)
               background Colors.lightGreen2
               color white
               width (px 35)
               height (px 35)
               lineHeight (px 35)
               marginLeft (px (-16))
               borderTopRightRadius (pct 50) (pct 50)
               borderTopLeftRadius (pct 50) (pct 50)
               borderBottomRightRadius (pct 50) (pct 50)
               borderBottomLeftRadius (pct 50) (pct 50)
               zIndex 99999
          ".timeline-panel" ?
            do width (pct 46)
               float floatLeft
               background white
               border (px 1) solid (parse "#d4d4d4")
               padding (px 20) (px 20) (px 20) (px 20)
               position relative
               borderRadius (px 8) (px 8) (px 8) (px 8)
               boxShadow nil (px 1) (px 6) (rgba 0 0 0 50) -- 0.15
               (":before" <> ":after") ?
                 do position absolute
                    top (px 26)
                    right (px (-15))
                    display inlineBlock
                    borderTop solid (px 15) transparent
                    borderBottom solid (px 15) transparent
                    content (stringContent "")
               before &
                 do borderLeft solid (px 15) (parse "#ccc")
                    borderRight solid nil (parse "#ccc")
               after &
                 do borderLeft solid (px 14) (parse "#fff")
                    borderRight solid nil (parse "#fff")
               ".noarrow" ? (":before" <> ":after") ?
                 do top nil
                    right nil
                    display none
                    border nil none none
          ".timeline-inverted" ? ".timeline-panel" ?
            do float floatRight
               (":before" <> ":after") ?
                 do borderLeftWidth nil
                    borderRightWidth (px 14)
                    left (px (-14))
                    right auto
