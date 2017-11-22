defmodule Annotatex.Posts.Post do
  use Ecto.Schema
  import Ecto.Changeset
  alias Annotatex.Posts.Post
  alias Annotatex.Taggings.Tagging
  alias Annotatex.Accounts.User

  @params ~w(title slug body external_url user_id)a
  @required_params ~w(title slug body user_id)a
  def permitted_params, do: @params
  def required_params,  do: @required_params

  @primary_key {:id, :binary_id, autogenerate: true}

  schema "posts" do
    field :title, :string
    field :slug, :string
    field :body, :string
    field :external_url, :string

    has_many :taggings, Tagging
    belongs_to :user, User

    timestamps()
  end

  @doc false
  def changeset(%Post{} = post, attrs) do
    post
    |> cast(attrs, permitted_params())
    |> validate_required(required_params())
  end
end
