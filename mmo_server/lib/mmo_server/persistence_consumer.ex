defmodule MmoServer.PersistenceConsumer do
  @moduledoc """
  GenStage consumer responsible for persisting game state.
  """
  use GenStage

  def start_link(opts) do
    GenStage.start_link(__MODULE__, opts, name: Keyword.get(opts, :name))
  end

  @impl true
  def init(opts) do
    producer = Keyword.fetch!(opts, :producer)
    {:consumer, %{}, subscribe_to: [{producer, max_demand: 1}]}
  end

  @impl true
  def handle_events(events, _from, state) do
    for _event <- events do
      # persist data using Repo
      :ok
    end
    {:noreply, [], state}
  end
end
