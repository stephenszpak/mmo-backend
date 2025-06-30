import Config

config :mmo_server,
  ecto_repos: [MmoServer.Repo]

config :mmo_server, MmoServerWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: String.duplicate("0", 64),
  render_errors: [view: MmoServerWeb.ErrorView, accepts: ~w(json), layout: false],
  pubsub_server: MmoServer.PubSub,
  live_view: [signing_salt: "salt"]

config :libcluster,
  topologies: [gossip: [strategy: Cluster.Strategy.Gossip]]

import_config "#{config_env()}.exs"
