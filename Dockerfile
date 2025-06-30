FROM elixir:1.17
WORKDIR /app/mmo_server
ENV MIX_ENV=prod
COPY mmo_server/ .
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only prod && \
    mix compile
CMD ["mix", "phx.server"]
