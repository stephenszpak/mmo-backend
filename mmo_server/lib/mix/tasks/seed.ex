defmodule Mix.Tasks.Seed do
  use Mix.Task
  alias MmoServer.{Repo}
  alias MmoServer.Game.{ZoneSchema, User, Character}

  @shortdoc "Seed starter zones and an orc"
  def run(_args) do
    Mix.Task.run("app.start")

    Repo.insert!(ZoneSchema.changeset(%ZoneSchema{}, %{name: "Starter Zone 1"}))
    Repo.insert!(ZoneSchema.changeset(%ZoneSchema{}, %{name: "Starter Zone 2"}))

    user = Repo.insert!(User.changeset(%User{}, %{email: "orc@example.com", password_hash: "hash"}))
    Repo.insert!(Character.changeset(%Character{}, %{name: "Gruk", user_id: user.id, zone_id: 1}))
  end
end
