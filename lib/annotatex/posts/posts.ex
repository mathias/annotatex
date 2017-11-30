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
    query = from Post, order_by: [desc: :published_at], preload: [:taggings, :user]

    Repo.all(query)
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
    Post
    |> Repo.get!(id)
    |> Repo.preload(:user)
  end

  @doc """
  Creates a post.

  ## Examples

      iex> create_post(%{title: "Foo", body: "Bar"})
      {:ok, %Post{}}

      iex> create_post(%{foo: "baz"})
      {:error, %Ecto.Changeset{}}

  """
  def create_post(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert()
  end

  def create_post!(attrs \\ %{}) do
    %Post{}
    |> Post.changeset(attrs)
    |> Repo.insert!()
  end

  @doc """
  Updates a post.

  ## Examples

      iex> update_post(post, %{field: new_value})
      {:ok, %Post{}}

      iex> update_post(post, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_post(%Post{} = post, attrs) do
    post
    |> Post.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Post.

  ## Examples

      iex> delete_post(post)
      {:ok, %Post{}}

      iex> delete_post(post)
      {:error, %Ecto.Changeset{}}

  """
  def delete_post(%Post{} = post) do
    Repo.delete(post)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking post changes.

  ## Examples

      iex> change_post(post)
      %Ecto.Changeset{source: %Post{}}

  """
  def change_post(%Post{} = post) do
    Post.changeset(post, %{})
  end
end
