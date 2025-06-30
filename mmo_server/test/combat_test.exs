defmodule MmoServer.CombatTest do
  use ExUnit.Case

  test "combat tick" do
    {:ok, pid} = MmoServer.CombatEngine.start_link([])
    send(pid, :tick)
    assert Process.alive?(pid)
    GenServer.stop(pid)
  end
end
