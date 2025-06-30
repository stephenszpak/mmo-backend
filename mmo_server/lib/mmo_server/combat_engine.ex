defmodule MmoServer.CombatEngine do
  @moduledoc """
  Runs combat ticks at 10 Hz.
  """
  use GenServer

  @tick 100

  def start_link(_) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(state) do
    :timer.send_interval(@tick, :tick)
    {:ok, state}
  end

  @impl true
  def handle_info(:tick, state) do
    # TODO: resolve combat interactions
    {:noreply, state}
  end
end
