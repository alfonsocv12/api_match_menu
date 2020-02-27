defmodule MatchMenuWeb.BaseController do
  use MatchMenuWeb, :controller

  def index(conn, _params) do
    json(conn, %{status: "Listo"})
  end

end
