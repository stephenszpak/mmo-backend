FROM elixir:1.17
WORKDIR /app
ENV MIX_ENV=prod
COPY . .
RUN mix local.hex --force && \
    mix local.rebar --force && \
    mix deps.get --only prod && \
    mix compile
CMD ["mix", "phx.server"]
