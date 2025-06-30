defmodule MmoServer.PersistenceTest do
  use MmoServer.DataCase

  test "persistence worker starts" do
    {:ok, pid} = MmoServer.PersistenceWorker.start_link([])
    assert Process.alive?(pid)
    GenServer.stop(pid)
  end
end
