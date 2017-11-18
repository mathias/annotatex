defmodule Annotatex.Link do
  use Ecto.Schema
  import Ecto.Changeset
  alias Annotatex.Link


  schema "links" do
    field :commentary, :string
    field :external_url, :string
    field :tags, :string
    field :title, :string

    timestamps()
  end

  @doc false
  def changeset(%Link{} = link, attrs) do
    link
    |> cast(attrs, [:title, :external_url, :commentary, :tags])
    |> validate_required([:title, :external_url, :commentary, :tags])
  end
end
