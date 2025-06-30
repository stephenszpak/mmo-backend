defmodule MmoServer.Zone do
  @moduledoc """
  GenServer representing a world zone.
  """
  use GenServer

  def start_link(id) do
    GenServer.start_link(__MODULE__, %{id: id, players: MapSet.new()}, name: via(id))
  end

  def via(id), do: {:via, Horde.Registry, {MmoServer.Registry, {:zone, id}}}

  def add_player(zone_id, pid), do: GenServer.cast(via(zone_id), {:add_player, pid})
  def remove_player(zone_id, pid), do: GenServer.cast(via(zone_id), {:remove_player, pid})

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_cast({:add_player, pid}, state) do
    {:noreply, %{state | players: MapSet.put(state.players, pid)}}
  end

  def handle_cast({:remove_player, pid}, state) do
    {:noreply, %{state | players: MapSet.delete(state.players, pid)}}
  end
end
