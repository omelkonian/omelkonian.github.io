{-# LANGUAGE OverloadedStrings #-}
import Prelude hiding (all, span, concat)
import Clay hiding (footer)
import Data.Monoid ((<>))
import qualified Data.Text as T
import Data.Text (concat)
import Control.Monad (forM_)

main :: IO ()
main = putCss $
  do imports
     general
     buttons
     footer

imports :: Css
imports = do
  importUrl "http://fonts.googleapis.com/css?family=Lato:400,900,300,900italic"
  let sections = ["banner", "projects", "interests", "skills", "career", "contact"]
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
       transition "all" (sec 0.2) linear none
       focus & outline none none none
  ul ?
    do margin nil nil nil nil
       padding nil nil nil nil
       li ? listStyle none none none
  ".row" ?
    padding (px 40) nil (px 92) nil
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

buttons :: Css
buttons = do
  ".lg" ? width (px 260)
  (".btn-border" <> ".btn-common") ?
    do color white
       fontSize (px 22)
       border solid (px 1) white
       padding (px 16) (px 36) nil nil
       fontWeight (weight 400)
       margin nil (px 36) nil (px 36)
       borderRadius (px 4) nil nil nil
       position relative
       zIndex 10
       after &
         do width (pct 100)
            height (px 0)
            bottom (px 0)
            left (px 0)
            background white
       hover &
         do color green
            after & height (pct 100)

  ".btn-common" ?
    do background green
       border solid (px 1) green
       hover & do
         background green
         border solid (px 1) green
  ".btn:after" ?
    do content (stringContent "")
       position absolute
       zIndex (-1)
       transition "all" (sec 0.3) ease none

footer :: Css
footer = do
  "#footer" ?
    do color white
       width (pct 100)
       background (parse "#28363f")
       borderTop solid (px 1) white
       ".row" ? padding (px 20) nil none none
       p ?
         do fontSize (px 18)
            fontWeight (weight 400)
       a ?
         do color green
            textDecoration none
            hover & color (parse "#6c9c01")
  ".fa" ? color white
