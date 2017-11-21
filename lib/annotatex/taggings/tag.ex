defmodule Annotatex.Taggings.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Annotatex.Taggings.Tag

  schema "tags" do
    field :name
    field :taggings_count

    timestamps()
  end

  @doc false
  def changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:name, :taggings_count])
    |> validate_required([:name, :taggings_count])
  end
end
