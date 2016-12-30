{-# LANGUAGE OverloadedStrings #-}
import Clay (putCss)
import Utils (chart)

main :: IO ()
main = putCss $ chart "skills"
