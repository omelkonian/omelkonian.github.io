{-# LANGUAGE OverloadedStrings #-}
import Prelude hiding (all, span, concat)
import Clay hiding (border, footer)
import Data.Monoid ((<>))
import qualified Data.Text as T
import Data.Text (concat)
import Control.Monad (forM_)
import Utils (border)
import Colors

main :: IO ()
main = putCss $
  do imports
     general
     buttons

imports :: Css
imports = do
  importUrl "http://fonts.googleapis.com/css?family=Lato:400,900,300,900italic"
  importUrl "timeline.css"
  let sections = ["banner", "projects", "interests", "skills", "career", "grades", "contact"]
  forM_ sections (\s -> importUrl (concat ["sections/", s, ".css"]))

general :: Css
general = do
  body ?
    do background white
       fontFamily ["Lato"] [sansSerif]
       fontSize (px 16)
       fontWeight (weight 300)
       boxSizing borderBox
  a ?
    do textDecoration none
       transition "all" (sec 0.2) linear (sec 0)
       focus & outlineWidth none
  ul ?
    do margin nil nil nil nil
       padding nil nil nil nil
       li ? ("list-style" -: "none")
  ".row" ?
    padding (px 15) nil (px 15) nil
  img ?
    do maxWidth (pct 100)
       height auto
  ".section-title" ?
    do textAlign $ alignSide sideLeft
       fontSize (px 42)
       fontWeight (weight 400)
       color (parse "#454545")
       margin nil (px 10) (px 50) nil
       padding nil nil nil nil
       textTransform uppercase
       span ? fontWeight (weight 900)
  ".fa" ? color white

buttons :: Css
buttons = do
  ".lg" ? width (px 260)
  (".btn-border" <> ".btn-common") ?
    do color white
       width (pct 90)
       fontSize (px 22)
       fontWeight (weight 400)
       border (px 1) solid white
       borderRadius (px 4) (px 4) (px 4) (px 4)
       position relative
       zIndex 10
       after &
         do width (pct 100)
            height (px 0)
            bottom (px 0)
            left (px 0)
            background white
       hover & color green
  ".btn-info" ?
    do color white
       fontSize (px 22)
       fontWeight (weight 400)
       border (px 1) solid white
       borderRadius (px 4) (px 4) (px 4) (px 4)
       position relative
       zIndex 10
       after &
         do width (pct 100)
            height (px 0)
            bottom (px 0)
            left (px 0)
            background white
       hover & color green
  (".btn-border:hover:after" <> ".btn-common:hover:after") ?
       height (pct 100)

  (".btn-common" <> ".btn-info") ?
    do background green
       border (px 1) solid green
       hover & do
         background green
         border (px 1) solid green

  ".btn:after" ?
    do content (stringContent "")
       position absolute
       zIndex (-1)
       transition "all" (sec 0.3) ease (sec 0)

  ".highlighted" ?
    do background white
       color Colors.basicGreen
       textAlign (alignSide sideCenter)
       textDecoration none
       transition "all" (sec 0.3) ease (sec 0)
       hover & do background Colors.basicGreen
                  color white

  ".btn-collapse" ?
    do margin (px 50) nil (px 50) nil
       a ? i ? do fontSize (px 25)
                  padding (px 12) (px 12) (px 12) (px 12)
                  width (px 40)
                  height (px 40)
                  borderRadius (pct 50) (pct 50) (pct 50) (pct 50)

  ".btn-collapse2" ? a ? i ?
    do fontSize (px 25)
       borderRadius (px 15) (px 15) (px 15) (px 15)
       padding (px 10) (px 10) (px 10) (px 10)
