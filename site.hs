--------------------------------------------------------------------------------
{-# LANGUAGE OverloadedStrings #-}
import Data.Monoid (mappend)
import Hakyll
--------------------------------------------------------------------------------
main :: IO ()
main = hakyll $ do

  -- Transfer images
  match "images/*" $ do
    route   idRoute
    compile copyFileCompiler

  -- Compress CSS files
  match "css/*" $ do
    route   idRoute
    compile compressCssCompiler

  -- Generate sections
  match "sections/*" $ do
    route $ setExtension "html"
    compile $ pandocCompiler
      >>= loadAndApplyTemplate "templates/section.html" defaultContext
      >>= loadAndApplyTemplate "templates/default.html" defaultContext
      >>= relativizeUrls

  -- Generate index
  match "index.html" $ do
    route idRoute
    compile $ do
      sections <- loadAll "sections/*"
      let indexCtx =
            listField "sections" defaultContext (return sections) `mappend`
            constField "title" "Home"                             `mappend`
            defaultContext

      getResourceBody
        >>= applyAsTemplate indexCtx
        >>= loadAndApplyTemplate "templates/default.html" indexCtx
        >>= relativizeUrls

  -- Load templates
  match "templates/*" $ compile templateBodyCompiler

--------------------------------------------------------------------------------
