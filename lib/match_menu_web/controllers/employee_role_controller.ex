defmodule MatchMenuWeb.EmployeeRoleController do
  use MatchMenuWeb, :controller

  alias MatchMenu.Catalogs

  action_fallback MatchMenuWeb.FallbackController

  def index(conn, _params) do
    employee_roles = Catalogs.list_employee_roles()
    render(conn, "index.json", employee_roles: employee_roles)
  end
end
