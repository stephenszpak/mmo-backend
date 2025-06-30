defmodule MmoServer.Repo.Migrations.CreateCharacters do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :user_id, references(:users), null: false
      add :name, :string, null: false
      add :zone_id, references(:zones), null: false

      timestamps()
    end

    create index(:characters, [:user_id])
  end
end
