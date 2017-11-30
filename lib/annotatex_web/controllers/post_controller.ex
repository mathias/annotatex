defmodule AnnotatexWeb.PostController do
  use AnnotatexWeb, :controller

  alias Annotatex.Repo
  alias Annotatex.Posts
  alias Annotatex.Posts.Post
  alias Annotatex.Accounts

  def index(conn, _params) do
    posts = Posts.list_posts |> Repo.preload(taggings: [:tag])
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id) |> Repo.preload(taggings: [:tag])
    render(conn, "show.html", post: post)
  end

  def new(conn, _params) do
    # TODO mathias: real current user here when auth implemented
    current_user = Accounts.get_user_by_email!("matt.gauger@gmail.com")

    changeset = Posts.change_post(%Post{})

    conn
    |> assign(:changeset, changeset)
    |> assign(:current_user, current_user)
    |> render("new.html")
  end

  def create(conn, %{"post" => post_params}) do
    # TODO mathias: real current user here when auth implemented
    current_user = Accounts.get_user_by_email!("matt.gauger@gmail.com")

    changeset = Map.put(post_params, :user_id, current_user.id)

    case Posts.create_post(post_params) do
      {:ok, post} ->
        conn
        |> assign(:current_user, current_user)
        |> put_flash(:info, "Post created.")
        |> redirect(to: post_path(conn, :show, post))
      {:error, %Ecto.Changeset{} = changeset} ->
        conn
        |> assign(:current_user, current_user)
        |> assign(:changeset, changeset)
        |> render("new.html")
    end
  end
end
