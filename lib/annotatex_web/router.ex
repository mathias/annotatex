defmodule AnnotatexWeb.Router do
  use AnnotatexWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :maybe_browser_auth do
    plug(Guardian.Plug.VerifySession)
    plug(Guardian.Plug.VerifyHeader, realm: "Bearer")
    plug(Guardian.Plug.LoadResource)
  end

  pipeline :ensure_authed_access do
    plug(Guardian.Plug.EnsureAuthenticated, %{"typ" => "access", error_handler: Annotatex.HttpErrorHandler})
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", AnnotatexWeb do
    pipe_through([:browser, :maybe_browser_auth])


    get "/", PostController, :index
    get "/post/new", PostController, :new
    get "/post/:id", PostController, :show
    post "/post/", PostController, :create

    #get("/login", LoginController, :new)
    #post("/login", LoginController, :create)
    #delete("/login", LoginController, :delete)

    get "/about", PageController, :about
  end

  #scope "/admin", AnnotatexWeb do
    #pipe_through([:browser, :maybe_browser_auth, :ensure_authed_access])
  #end

  # Other scopes may use custom stacks.
  # scope "/api", AnnotatexWeb do
    #   pipe_through :api
    # end
end
