{-# LANGUAGE OverloadedStrings, TypeApplications #-}
import Clay hiding (border)
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Colors
import Utils (border)

main :: IO ()
main = putCss projects

projects :: Css
projects = "#projects" ? do
  background (url "../../images/backgrounds/smoke-white-on-black2.jpg")
  backgroundSize cover
  color white
  textAlign center
  paddingBottom (px 150)
  (".container" <> ".section-title") ? color white
  (".fab-bitbucket" <> ".fab-github") ? float floatLeft
  (".fa-book" <> ".fab-soundcloud") ? float floatRight
  ".info" ? do
    p ? do
      fontSize (px 16)
      color white
      fontWeight (weight 400)
      fontStyle italic
      paddingTop (px 22)
      paddingBottom (px 22)
    h4 ? do
      marginTop (px 50)
      fontSize (px 22)
      fontWeight (weight 700)
      textAlign center
    h5 ? do
      fontSize (px 16)
      fontWeight (weight 700)
      textTransform uppercase
    h6 ? do
      fontSize (px 16)
      fontWeight (weight 700)
      color "#1f8e0a"
      wordSpacing (px 10)
  "#carousel" ? do
    height (px 400)
    ".item" ? do
      background black
      color white
      width (px 600)
      height (px 300)
    ".image" ? do
        img ? do
          background white
          width (px 300)
          height (px 300)
        "#wip" ? do
            position absolute
            transforms [ rotate @Deg 310
                       , translate (other "65%") (other "-25%")
                       ]
            fontFamily ["Rock Salt"] []
            fontSize (px 24)
            color red

    ".info" ? do
      a ? wordSpacing (px 20)
      i ? hover & color green
      i ? do
        fontSize (px 30)
        lineHeight (px 50)


