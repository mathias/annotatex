defmodule AnnotatexWeb.PostController do
  use AnnotatexWeb, :controller

  alias Annotatex.Repo
  alias Annotatex.Posts
  alias Annotatex.Taggings

  def index(conn, _params) do
    posts = Posts.list_posts |> Repo.preload(taggings: [:tag])
    render(conn, "index.html", posts: posts)
  end

  def show(conn, %{"id" => id}) do
    post = Posts.get_post!(id) |> Repo.preload(taggings: [:tag])
    render(conn, "show.html", post: post)
  end
end
