defmodule Annotatex.Posts do
  @moduledoc """
  The Posts context.
  """

  import Ecto.Query, warn: false
  alias Annotatex.Repo
  alias Annotatex.Posts.Post

  @doc """
  Returns the list of all posts.

  ## Examples

      iex> list_posts()
      [%Post{}, ...]

  """
  def list_posts do
    Post
    |> Repo.all
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{field: value})
      {:ok, %Post{}}

      iex> create_post(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Finds a post by uuid.

  ## Examples

      iex> get_post!(id)
      {:ok, %Post{}}

      iex> get_post!(bad_value)
      {:error, {}}

  """
  def get_post!(id) do
    User
    |> Repo.get!(id)
  end
end
