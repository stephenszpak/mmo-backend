defmodule MmoServer.Game.Inventory do
  use Ecto.Schema
  import Ecto.Changeset

  schema "inventories" do
    field :slot, :integer
    field :item_id, :integer
    belongs_to :character, MmoServer.Game.Character
    timestamps()
  end

  def changeset(inv, attrs) do
    inv
    |> cast(attrs, [:slot, :item_id, :character_id])
    |> validate_required([:slot, :item_id, :character_id])
  end
end
