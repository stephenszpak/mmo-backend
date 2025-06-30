defmodule MmoServer.Repo.Migrations.CreateZones do
  use Ecto.Migration

  def change do
    create table(:zones) do
      add :name, :string, null: false
      timestamps()
    end
  end
end
