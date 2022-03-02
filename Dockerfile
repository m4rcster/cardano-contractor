FROM haskell:latest
RUN cabal update && cabal install
ENTRYPOINT ["cardano-contractor"]
