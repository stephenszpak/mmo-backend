defmodule MmoServer.Repo.Migrations.CreateInventory do
  use Ecto.Migration

  def change do
    create table(:inventories) do
      add :character_id, references(:characters), null: false
      add :slot, :integer, null: false
      add :item_id, :integer, null: false

      timestamps()
    end

    create index(:inventories, [:character_id])
  end
end
