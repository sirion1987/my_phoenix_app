defmodule MyPhoenixAppWeb.HelloController do
  use MyPhoenixAppWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def show(conn, %{"id" => id}) do
    render(conn, "show.html", messenger: id)
  end
end
