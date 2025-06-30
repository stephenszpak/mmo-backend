import Config

config :mmo_server, MmoServer.Repo,
  url: System.get_env("DATABASE_URL"),
  pool_size: String.to_integer(System.get_env("POOL_SIZE") || "10")

config :mmo_server, MmoServerWeb.Endpoint,
  http: [port: String.to_integer(System.get_env("PORT") || "4000")],
  secret_key_base: Map.fetch!(System.get_env(), "SECRET_KEY_BASE")
