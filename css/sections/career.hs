{-# LANGUAGE OverloadedStrings #-}
import Clay hiding (border, table)
import Clay.Display (table)
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Colors
import Utils (border)

main :: IO ()
main = putCss $
  "#career" ?
    do background (url "../../images/backgrounds/lake.jpg")
       backgroundSize cover
       color black
       textAlign (alignSide sideCenter)
       ".container" ? paddingBottom (px 40)
       before & Colors.dim
       ".section-title" ? color black
       ".table" ?
         do display table
            margin nil auto nil auto
       ("li video" <> "li iframe") ?
         do width (pct 100.0)
            height (cm 6)
