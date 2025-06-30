defmodule BroadwayPostgres.Producer do
  @moduledoc """
  Minimal GenStage producer stub used in tests.
  This implementation does not actually read from Postgres
  but provides a producer that can be subscribed to by consumers.
  """
  use GenStage

  @impl true
  def start_link(opts) do
    GenStage.start_link(__MODULE__, opts, name: Keyword.get(opts, :name))
  end

  @impl true
  def init(_opts) do
    {:producer, %{}, dispatcher: {GenStage.BroadcastDispatcher, []}}
  end

  @impl true
  def handle_demand(_demand, state) do
    {:noreply, [], state}
  end
end
