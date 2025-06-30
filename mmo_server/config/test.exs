import Config

config :mmo_server, MmoServer.Repo,
  username: "postgres",
  password: "postgres",
  database: "mmo_server_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox

config :mmo_server, MmoServerWeb.Endpoint,
  http: [port: 4002],
  server: false
