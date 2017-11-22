defmodule AnnotatexWeb.LoginController do
  use AnnotatexWeb, :controller

  alias Annotatex.User

  def new(conn, params) do
    render conn, "login.html"
  end

  def create(conn, params) do
    #case User.find_and_confirm_password(params) do
    case {:error, {}} do
      {:ok, user} ->
        conn
        |> Guardian.Plug.sign_in(user, :access)
        |> redirect(to: "/")

      {:error, changeset} ->
        render conn, "login.html", changeset: changeset
    end
  end

  def delete(conn, _params) do
    conn
    |> Guardian.Plug.sign_out()
    |> put_flash(:info, "Logged out")
    |> redirect(to: "/")
  end
end
