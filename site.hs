--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid (mappend)
import Hakyll
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
  match "css/**" $ do
    route idRoute
    compile compressCssCompiler

  -- JS
  match "js/**" $ do
    route idRoute
    compile copyFileCompiler

  -- Assets
  match "assets/**" $ do
    route idRoute
    compile copyFileCompiler

--------------------------------------------------------------------------------
