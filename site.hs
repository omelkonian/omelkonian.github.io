--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Hakyll

import Data.Monoid ((<>))
import Control.Monad (forM_)

import Debug.Trace
--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do

  -- Generate sections
  match "sections/*" $ do
    route idRoute
    compile $ getResourceBody
      >>= loadAndApplyTemplate "templates/section.html" defaultContext
      >>= relativizeUrls

  -- Generate index
  match "index.html" $ do
    route idRoute
    compile $ do
      sections <- loadAll "sections/*"
      let strings = concatMap itemBody sections :: String
      let indexCtx =
            listField "sections" defaultContext (return sections) <>
            constField "title" "Home"                             <>
            defaultContext

      getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

  -- Load templates
  match "templates/*" $ compile templateBodyCompiler

  -- CSS
  match "css/**.css" $ do
    route idRoute
    compile compressCssCompiler

  -- CSS (Clay)
  match "css/**.hs" $ do
    route $ setExtension "css"
    compile clayCompiler

  -- JS (Coffeescript)
  match "js/**.coffee" $ do
    route $ setExtension "js"
    compile coffeeCompiler

  -- Just copy the rest
  copyAll ["google*.html", "images/**", "js/**.js", "data/**"]

--------------------------------------------------------------------------------
 where
  copyAll :: [Pattern] -> Rules ()
  copyAll = flip forM_ $ flip match (route idRoute >> compile copyFileCompiler)

  coffeeCompiler :: Compiler (Item String)
  coffeeCompiler = getResourceString >>=
    withItemBody (unixFilter "coffee" ["-s", "-c"])

  clayCompiler :: Compiler (Item String)
  clayCompiler = getResourceString >>=
    withItemBody (unixFilter "stack" ["exec", "runghc"])
