{-# LANGUAGE OverloadedStrings #-}
import Clay
import Utils (chart)

main :: IO ()
main = putCss $
  do "#skills" ? background (url "../../images/backgrounds/skills.jpg")
     chart "skills"
