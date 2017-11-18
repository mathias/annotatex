defmodule AnnotatexWeb.HomeController do
  use AnnotatexWeb, :controller

  alias Annotatex.Repo
  alias Annotatex.Link

  def index(conn, _params) do
    render conn, "index.html"
  end
end
