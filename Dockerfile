# Use the official Elixir image. The 1.17.4 tag does not exist yet,
# so we fall back to the generic 1.17 tag which always resolves to the
# latest available patch release.
FROM elixir:1.17
WORKDIR /app/mmo_server
# Compile the application in the same environment that docker-compose
# uses for running the container. This avoids requiring production only
# configuration such as `SECRET_KEY_BASE` during image build.
ENV MIX_ENV=dev
COPY mmo_server/ .
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get && \
    mix compile
CMD ["mix", "phx.server"]
