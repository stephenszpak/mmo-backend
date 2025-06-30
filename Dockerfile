# Use the official Elixir image with patch release 1.17.4 which
# avoids the compilation error present in 1.17.3.
FROM elixir:1.17.4-alpine
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
