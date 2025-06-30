import Config

if config_env() == :prod do
  config :mmo_server, MmoServerWeb.Endpoint, server: true
end
