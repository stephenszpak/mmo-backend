import Config

config :mmo_server, MmoServer.Repo,
  username: "postgres",
  password: "postgres",
  database: "mmo_server_dev",
  hostname: System.get_env("DATABASE_HOST") || "localhost",
  show_sensitive_data_on_connection_error: true,
  pool_size: 10

config :mmo_server, MmoServerWeb.Endpoint,
  http: [port: 4000],
  debug_errors: true,
  code_reloader: true,
  check_origin: false,
  watchers: []
