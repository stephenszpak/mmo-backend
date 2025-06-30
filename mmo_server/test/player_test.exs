defmodule MmoServer.PlayerTest do
  use MmoServer.DataCase

  test "player lifecycle" do
    {:ok, _} = MmoServer.Player.login(1, 1)
    assert %{zone: 1} = :sys.get_state(MmoServer.Player.via(1))

    MmoServer.Player.move(1, 1.0, 2.0, 3.0)
    assert %{position: {1.0, 2.0, 3.0}} = :sys.get_state(MmoServer.Player.via(1))

    MmoServer.Player.logout(1)
    refute Process.alive?(Process.whereis(MmoServer.Player.via(1)))
  end
end
