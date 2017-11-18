defmodule AnnotatexWeb.HomeController do
  use AnnotatexWeb, :controller

  alias Annotatex.Repo
  alias Annotatex.Link

  def index(conn, _params) do
    links = Repo.all(Link)
    render(conn, "index.html", links: links)
  end
end
