defmodule MyPhoenixAppWeb.HelloController do
  use MyPhoenixAppWeb, :controller

  plug :assign_welcome_message, "Welcome back" when action in [:show]

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => id}) do
    conn
    |> assign(:name, String.capitalize(id))
    |> render("show.html")
  end

  defp assign_welcome_message(conn, msg) do
    assign(conn, :welcome_message, msg)
  end
end
