FROM haskell:8.10.7

WORKDIR /opt/app

RUN cabal update

ADD ./cardano-contractor.cabal /opt/app/cardano-contractor.cabal

RUN cabal build --only-dependencies -j4

COPY . /opt/app

RUN cabal install

CMD ["cardano-contractor"]

EXPOSE 3000
