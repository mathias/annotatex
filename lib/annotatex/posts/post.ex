defmodule Annotatex.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Annotatex.Posts.Post
  alias Annotatex.Taggings.Tagging
  alias Annotatex.Accounts.User

  @params ~w(title slug body external_url user_id published_at)a
  @required_params ~w(title body user_id)a
  def permitted_params, do: @params
  def required_params,  do: @required_params

  @primary_key {:id, Ecto.UUID, autogenerate: true}
  @foreign_key_type Ecto.UUID

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :body, :string
    field :external_url, :string
    field :published_at, :utc_datetime

    has_many :taggings, Tagging
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, permitted_params())
    |> validate_required(required_params())
    |> add_slug
  end

  defp generate_slug do
    16
    |> :crypto.strong_rand_bytes
    |> :base64.encode
    |> String.replace(~r/[^A-Za-z0-9]/, "")
    |> String.slice(0, 10)
    |> String.downcase
  end

  defp add_slug(changeset) do
    case get_field(changeset, :slug) do
      nil ->
        generate_slug()
        |> (&put_change(changeset, :slug, &1)).()
      _ ->
        changeset
    end
  end
end
