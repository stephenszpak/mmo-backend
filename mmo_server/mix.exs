defmodule MmoServer.MixProject do
  use Mix.Project

  def project do
    [
      app: :mmo_server,
      version: "0.1.0",
      elixir: "~> 1.17",
      elixirc_paths: elixirc_paths(Mix.env()),
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [
      mod: {MmoServer.Application, []},
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  defp deps do
    [
      {:phoenix, "~> 1.7"},
      {:phoenix_pubsub, "~> 2.1"},
      {:phoenix_live_dashboard, "~> 0.8"},
      {:ecto_sql, "~> 3.11"},
      {:postgrex, ">= 0.17.0"},
      {:libcluster, "~> 3.3"},
      {:horde, "~> 0.8"},
      {:delta_crdt, "~> 0.6"},
      {:broadway, "~> 1.0"},
      {:broadway_postgres, "~> 0.4"},
      {:absinthe, "~> 1.7"},
      {:absinthe_phoenix, "~> 2.0"}
    ]
  end
end
