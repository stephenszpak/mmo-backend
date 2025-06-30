defmodule MmoServer.Player do
  @moduledoc """
  GenServer representing a player character.
  """
  use GenServer

  @type id :: integer()

  def start_link(id) do
    GenServer.start_link(__MODULE__, %{id: id, zone: nil, position: {0.0,0.0,0.0}}, name: via(id))
  end

  def via(id), do: {:via, Horde.Registry, {MmoServer.Registry, {:player, id}}}

  @spec login(id, integer()) :: {:ok, pid()} | {:error, term()}
  def login(id, zone_id) do
    Horde.DynamicSupervisor.start_child(MmoServer.PlayerSupervisor, {__MODULE__, id})
    move_zone(id, zone_id)
  end

  @spec logout(id) :: :ok
  def logout(id), do: GenServer.cast(via(id), :logout)

  @spec move(id, float(), float(), float()) :: :ok
  def move(id, x, y, z), do: GenServer.cast(via(id), {:move, {x,y,z}})

  @spec move_zone(id, integer()) :: :ok
  def move_zone(id, zone), do: GenServer.cast(via(id), {:move_zone, zone})

  @impl true
  def init(state), do: {:ok, state}

  @impl true
  def handle_cast({:move, pos}, state) do
    {:noreply, %{state | position: pos}}
  end

  def handle_cast({:move_zone, zone}, state) do
    if state.zone, do: MmoServer.Zone.remove_player(state.zone, self())
    MmoServer.Zone.add_player(zone, self())
    {:noreply, %{state | zone: zone}}
  end

  def handle_cast(:logout, state) do
    if state.zone, do: MmoServer.Zone.remove_player(state.zone, self())
    {:stop, :normal, state}
  end
end
