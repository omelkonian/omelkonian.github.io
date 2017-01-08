{-# LANGUAGE OverloadedStrings #-}
import Clay
import Utils (chart)

main :: IO ()
main = putCss $
  do "#grades" ? background (url "../../images/backgrounds/mountain.jpg")
     chart "grades"
