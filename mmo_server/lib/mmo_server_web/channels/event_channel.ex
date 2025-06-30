defmodule MmoServerWeb.EventChannel do
  @moduledoc """
  Channel for in-game events.
  """
  use Phoenix.Channel

  def join("event:" <> _topic, _params, socket) do
    {:ok, socket}
  end

  def handle_in("event", payload, socket) do
    push(socket, "event", payload)
    {:noreply, socket}
  end
end
