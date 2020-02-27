defmodule MatchMenuWeb.UserController do
  use MatchMenuWeb, :controller

  def login(conn, _params) do
    IO.puts(conn)
    text(conn, "hola")
  end
end
