{-# LANGUAGE OverloadedStrings #-}

module Contractor where

import Web.Scotty

import Data.Monoid (mconcat)

contractor :: IO ()
contractor =
  scotty 3000 $
  get "/:word" $ do
    beam <- param "word"
    html $ mconcat ["<h1>Contractor</h1><p>", beam, "</p>"]
