defmodule MmoServer.Protocol.UDPServer do
  @moduledoc """
  Simple UDP server listening for movement and skill packets.
  """
  use GenServer
  require Logger

  @port 5555

  def start_link(_opts) do
    GenServer.start_link(__MODULE__, %{}, name: __MODULE__)
  end

  @impl true
  def init(state) do
    {:ok, socket} = :gen_udp.open(@port, [:binary, active: true])
    {:ok, Map.put(state, :socket, socket)}
  end

  @impl true
  def handle_info({:udp, _socket, _ip, _port, <<player_id::32, _action::16, x::float, y::float, z::float>>}, state) do
    MmoServer.Player.move(player_id, x, y, z)
    {:noreply, state}
  end

  def handle_info(_msg, state), do: {:noreply, state}
end
