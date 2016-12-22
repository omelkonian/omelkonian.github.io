--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Hakyll

import Data.Monoid (mappend)

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
            listField "sections" defaultContext (return sections) `mappend`
            constField "title" "Home"                             `mappend`
            defaultContext

      getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

  -- CV
  match "cv/*" $ do
    route idRoute
    compile copyFileCompiler

  -- Load templates
  match "templates/*" $ compile templateBodyCompiler

  -- Images
  match "images/**" $ do
    route idRoute
    compile copyFileCompiler

  -- CSS
  match "css/**.css" $ do
    route idRoute
    compile compressCssCompiler

  -- CSS (Clay)
  match "css/**.hs" $ do
    route $ setExtension "css"
    compile clayCompiler

  -- JS
  match "js/**.js" $ do
    route idRoute
    compile copyFileCompiler

  -- JS (Coffeescript)
  match "js/**.coffee" $ do
    route $ setExtension "js"
    compile coffeeCompiler

  -- Assets
  match "assets/**" $ do
    route idRoute
    compile copyFileCompiler

  -- Data
  match "data/**" $ do
    route idRoute
    compile copyFileCompiler

--------------------------------------------------------------------------------
 where
  coffeeCompiler :: Compiler (Item String)
  coffeeCompiler = getResourceString >>=
    withItemBody (unixFilter "coffee" ["-s", "-c"])

  clayCompiler :: Compiler (Item String)
  clayCompiler = getResourceString >>=
    withItemBody (unixFilter "stack" ["runghc"])
