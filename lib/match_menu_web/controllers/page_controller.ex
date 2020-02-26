defmodule MatchMenuWeb.PageController do
  use MatchMenuWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
