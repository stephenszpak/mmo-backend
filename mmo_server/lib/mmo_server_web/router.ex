defmodule MmoServerWeb.Router do
  use Phoenix.Router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", MmoServerWeb do
    pipe_through :api
  end
end
