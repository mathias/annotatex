defmodule Annotatex.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Annotatex.Repo
  alias Annotatex.Accounts.User

  @doc """
  Returns the list of all users.

  ## Examples

      iex> list_users()
      [%Post{}, ...]

  """
  def list_users do
    User
    |> Repo.all
  end

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Finds a user by id.

  ## Examples

      iex> get_user_by_id!(id)
      {:ok, %User{}}

      iex> get_user_by_id!(bad_value)
      {:error, {}}

  """
  def get_user_by_id!(id) do
    User
    |> Repo.get!(id)
  end

  @doc """
  Finds a user by email.

  ## Examples

      iex> get_user_by_email!(email)
      {:ok, %User{}}

      iex> get_user_by_email!(bad_value)
      {:error, {}}

  """
  def get_user_by_email!(email) do
    Repo.get_by(User, email: email)
  end

end
