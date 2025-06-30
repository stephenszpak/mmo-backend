defmodule MmoServerWeb.ChatChannel do
  @moduledoc """
  Channel for chat messages.
  """
  use Phoenix.Channel

  def join("chat:" <> _room, _params, socket) do
    {:ok, socket}
  end

  def handle_in("message", %{"body" => body}, socket) do
    broadcast!(socket, "message", %{body: body})
    {:noreply, socket}
  end
end
