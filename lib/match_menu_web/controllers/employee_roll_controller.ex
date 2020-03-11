defmodule MatchMenuWeb.EmployeeRollController do
  use MatchMenuWeb, :controller

  alias MatchMenu.Catalogs
  # alias MatchMenu.Catalogs.EmployeeRoll

  action_fallback MatchMenuWeb.FallbackController

  def index(conn, _params) do
    employee_rolls = Catalogs.list_employee_rolls()
    render(conn, "index.json", employee_rolls: employee_rolls)
  end
end
