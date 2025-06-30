defmodule MmoServer.PersistenceWorker do
  @moduledoc """
  GenStage pipeline persisting game state to Postgres.
  """
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    children = [
      {BroadwayPostgres.Producer, name: BroadwayPostgres.Producer},
      {MmoServer.PersistenceConsumer, [producer: BroadwayPostgres.Producer]}
    ]

    Supervisor.init(children, strategy: :rest_for_one)
  end
end
