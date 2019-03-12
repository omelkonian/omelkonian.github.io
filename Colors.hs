{-# LANGUAGE OverloadedStrings #-}
module Colors where

import Clay

-- Basic
dim = background $ rgba 1 0 2 180

-- Colors
orange      = parse "#f9c40a"
basicGreen  = parse "#1f8e0a"
lightGreen  = parse "#779900"
lightGreen2 = parse "#448822"
darkGreen   = parse "#226600"
darkGray    = parse "#414141"
lightGray   = parse "#ededed"

-- Icons
soundcloud    = parse "#bb5522"
bitbucket     = parse "#007bb6"
documentation = parse "#dd4b39"
twitter       = parse "#00aced"
facebook      = parse "#3b5998"
google        = parse "#dd4b39"
lastfm        = parse "#ff0000"
linkedin      = parse "#287bbc"
codinGame     = parse "#ffff00"
