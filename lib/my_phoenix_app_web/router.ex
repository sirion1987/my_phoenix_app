defmodule MyPhoenixAppWeb.Router do
  use MyPhoenixAppWeb, :router

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", MyPhoenixAppWeb do
    pipe_through :browser

    get "/", PageController, :index

    resources "/hello", HelloController, only: [:index, :show]
    resources "/users", UserController

    resources "/sessions", SessionController,
      only: [:new, :create, :delete],
      singleton: true
  end

  defp authenticate_user(conn, _) do
    case get_session(conn, :user_id) do
      nil ->
        conn
        |> Phoenix.Controller.put_flash(:error, "Login required")
        |> Phoenix.Controller.redirect(to: "/")
        |> halt()
      user_id ->
        assign(conn, :current_user, MyPhoenixAppWeb.Accounts.get_user!(user_id))
    end
  end
end
