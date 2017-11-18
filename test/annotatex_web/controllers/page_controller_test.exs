defmodule AnnotatexWeb.PageControllerTest do
  use AnnotatexWeb.ConnCase

  test "GET /about", %{conn: conn} do
    conn = get conn, "/"
    assert html_response(conn, 200)
  end
end
