defmodule Annotatex.Taggings do
  @moduledoc """
  The Taggings context.
  """

  import Ecto.Query, warn: false
  alias Annotatex.Repo
  alias Annotatex.Posts.Post
  alias Annotatex.Taggings.Tag
  alias Annotatex.Taggings.Tagging

  @doc """
  Returns the list of all tags.

  ## Examples

      iex> list_tags()
      [%Tag{}, ...]

  """
  def list_tags do
    Repo.all(Tag)
  end

  @doc """
  Finds tags by post.

  ## Examples

      iex> get_tags_for_post!(post)
      {:ok, [%Tag{}, ...]}

      iex> get_tags_for_post!(post)
      {:error, []}

  """
  def get_tags_for_post!(post) do
    query = from t in Tagging, where: t.post_id == ^post.id, preload: [:tags]
    Repo.all(query)
  end

  @doc """
  Creates a tag.

  ## Examples

      iex> create_tag(%{field: value})
      {:ok, %Tag{}}

      iex> create_tag(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_tag(attrs \\ %{}) do
    %Tag{}
    |> Tag.changeset(attrs)
    |> Repo.insert()
  end
end
