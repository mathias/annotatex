defmodule Annotatex.Taggings.Tag do
  use Ecto.Schema
  import Ecto.Changeset
  alias Annotatex.Taggings.Tag

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "tags" do
    field :name, :string
    field :taggings_count, :integer

    timestamps()
  end

  @doc false
  def changeset(%Tag{} = tag, attrs) do
    tag
    |> cast(attrs, [:name, :taggings_count])
    |> validate_required([:name, :taggings_count])
  end
end
