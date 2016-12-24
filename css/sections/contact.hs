{-# LANGUAGE OverloadedStrings #-}
import Clay hiding (border, icon)
import Prelude hiding (all, span, concat)
import Data.Monoid ((<>))
import Colors
import Utils (border, icon)

main :: IO ()
main = putCss $ "#contact" ?
  do background (url "../../images/backgrounds/contact.jpg")
     backgroundSize cover
     paddingBottom (px 70)
     before & Colors.dim
     ".section-title" ? color white
     ".address" ?
       do color white
          margin nil nil nil nil
          padding nil nil nil nil
          h2 ?
            do fontSize (px 25)
               fontWeight (weight 700)
               textTransform uppercase
               marginTop nil
               paddingBottom (px 30)
          ".social-icon" ? li ?
            do float floatLeft
               a ?
                 do display inlineBlock
                    color white
                    margin nil (px 5) nil (px 5)
                    i ?
                      do fontSize (px 18)
                         width (px 48)
                         height (px 48)
                         border (px 1) solid white
                         textAlign (alignSide sideCenter)
                         lineHeight (px 48)
                         verticalAlign middle
                         transition "all" (sec 0.2) linear (sec 0)
                    icon ".fa-twitter" Colors.twitter
                    icon ".fa-facebook" Colors.facebook
                    icon ".fa-database" Colors.database
                    icon ".fa-soundcloud" Colors.soundcloud
                    icon ".fa-google-plus" Colors.google
                    icon ".fa-lastfm" Colors.lastfm
          ".contact-info" ?
            do paddingBottom (px 30)
               li ?
                 do fontSize (px 20)
                    fontWeight normal
                    lineHeight (px 28)
                    i ?
                      do paddingRight (px 15)
                         fontSize (px 15)
