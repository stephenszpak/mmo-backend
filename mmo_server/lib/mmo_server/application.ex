defmodule MmoServer.Application do
  @moduledoc """
  Application entry point starting the supervision tree.
  """
  use Application

  def start(_type, _args) do
    children = [
      MmoServer.Repo,
      {Phoenix.PubSub, name: MmoServer.PubSub},
      MmoServerWeb.Endpoint,
      {Cluster.Supervisor, [Application.get_env(:libcluster, :topologies), [name: MmoServer.ClusterSupervisor]]},
      {Horde.Registry, [name: MmoServer.Registry, keys: :unique]},
      {MmoServer.ZoneSupervisor, []},
      {MmoServer.PlayerSupervisor, []},
      MmoServer.CombatEngine,
      MmoServer.PersistenceWorker,
      MmoServer.Protocol.UDPServer
    ]

    opts = [strategy: :one_for_one, name: MmoServer.Supervisor]
    Supervisor.start_link(children, opts)
  end

  def config_change(changed, _new, removed) do
    MmoServerWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
