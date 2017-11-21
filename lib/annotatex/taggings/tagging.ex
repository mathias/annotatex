defmodule Annotatex.Taggings.Tagging do
  use Ecto.Schema
  import Ecto.Changeset
  alias Annotatex.Taggings.{Tagging,Tag}
  alias Annotatex.Posts.Post

  schema "taggings" do
    belongs_to :tag, Tag
    belongs_to :post, Post

    timestamps()
  end

  @doc false
  def changeset(%Tagging{} = tagging, attrs) do
    tagging
    |> cast(attrs, [:tag, :post])
    |> validate_required([:tag, :post])
  end
end
