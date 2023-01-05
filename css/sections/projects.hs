{-# LANGUAGE OverloadedStrings #-}
import Clay hiding (border)
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Colors
import Utils (border)

main :: IO ()
main = putCss publications

publications :: Css
publications = "#publications" ?
  do background white
     color black
     textAlign (alignSide sideLeft)
     padding (px 20) (px 20) (px 20) (px 20)
     ("dt" <> "dd") ? marginBottom (px 20)
     "dt" ? fontWeight (weight 500)
     ".paperTitle" ? fontWeight bold
     ".paperAuthors" ? fontWeight normal
     ".paperVenue" ? fontWeight lighter
     (".fa" <> ".fab" <> ".far" <> ".fas") ? color black
     "a" ? float floatRight
