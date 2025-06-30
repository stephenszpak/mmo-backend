defmodule MmoServerWeb.Endpoint do
  use Phoenix.Endpoint, otp_app: :mmo_server

  socket "/socket", Phoenix.Channel

  plug Plug.RequestId
  plug Plug.Telemetry, event_prefix: [:phoenix, :endpoint]

  plug Plug.Parsers,
    parsers: [:urlencoded, :multipart, :json],
    pass: ["*/*"],
    json_decoder: Phoenix.json_library()

  plug Plug.MethodOverride
  plug Plug.Head

  plug MmoServerWeb.Router
end
