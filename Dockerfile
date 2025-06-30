# Use the Hex.pm maintained image with a patch release of Elixir that
# avoids the compilation error present in 1.17.3.
FROM hexpm/elixir:1.17.4-erlang-26.2-alpine
WORKDIR /app/mmo_server
# Install build tools needed for dependencies like postgrex
RUN apk add --no-cache build-base git

# Install Hex and Rebar and fetch dependencies separately so Docker can
# cache the layers when the dependency manifest doesn't change.
ENV MIX_ENV=dev
COPY mmo_server/mix.exs mmo_server/mix.lock ./
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get

# Copy the rest of the source and compile
COPY mmo_server/ ./
RUN mix compile
CMD ["mix", "phx.server"]
