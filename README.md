# MMO Server

Elixir/Phoenix based MMORPG server skeleton.

## Setup

```bash
mix deps.get
mix ecto.create
mix ecto.migrate
mix seed
mix test
```

## Development Container

Build with Docker Compose:

```bash
docker-compose build
```

Run the app:

```bash
docker-compose up
```
