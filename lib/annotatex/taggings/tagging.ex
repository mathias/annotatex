defmodule Annotatex.Taggings.Tagging do
  use Ecto.Schema
  import Ecto.Changeset
  alias Annotatex.Taggings.{Tagging, Tag}
  alias Annotatex.Posts.Post

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "taggings" do
    belongs_to :tag, Tag
    belongs_to :post, Post

    timestamps()
  end

  @doc false
  def changeset(%Tagging{} = tagging, attrs) do
    tagging
    |> cast(attrs, [:tag_id, :post_id])
    |> put_assoc(:tag, attrs.tag)
    |> put_assoc(:post, attrs.post)
  end
end
