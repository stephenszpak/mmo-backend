defmodule BroadwayPostgres.Producer do
  @moduledoc """
  Minimal stub for BroadwayPostgres producer used in tests.
  This implementation does not actually read from Postgres
  but satisfies the expected behaviour of a Broadway producer.
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
