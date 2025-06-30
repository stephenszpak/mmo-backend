defmodule MmoServer.PlayerSupervisor do
  @moduledoc """
  Horde supervisor for Player processes.
  """
  use Horde.DynamicSupervisor

  def start_link(opts) do
    Horde.DynamicSupervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl true
  def init(_opts) do
    Horde.DynamicSupervisor.init(strategy: :one_for_one)
  end
end
