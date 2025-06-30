defmodule MmoServer.Game.Character do
  use Ecto.Schema
  import Ecto.Changeset

  schema "characters" do
    field :name, :string
    belongs_to :user, MmoServer.Game.User
    belongs_to :zone, MmoServer.Game.ZoneSchema
    timestamps()
  end

  def changeset(character, attrs) do
    character
    |> cast(attrs, [:name, :user_id, :zone_id])
    |> validate_required([:name, :user_id, :zone_id])
  end
end
