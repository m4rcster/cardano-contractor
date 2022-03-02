FROM haskell:8.10.7

RUN cabal update

# Add .cabal file
ADD ./cardano-contractor.cabal /opt/server/cardano-contractor.cabal

# Docker will cache this command as a layer, freeing us up to
# modify source code without re-installing dependencies
RUN cd /opt/server && cabal install --only-dependencies -j4

# Add and Install Application Code
ADD ./server /opt/server
RUN cd /opt/server && cabal install

# Add installed cabal executables to PATH
ENV PATH /root/.cabal/bin:$PATH

# Default Command for Container
WORKDIR /opt/server
CMD ["cardano-contractor"]

EXPOSE 3000
