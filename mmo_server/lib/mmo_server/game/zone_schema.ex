defmodule MmoServer.Game.ZoneSchema do
  use Ecto.Schema
  import Ecto.Changeset

  schema "zones" do
    field :name, :string
    timestamps()
  end

  def changeset(zone, attrs) do
    zone
    |> cast(attrs, [:name])
    |> validate_required([:name])
  end
end
