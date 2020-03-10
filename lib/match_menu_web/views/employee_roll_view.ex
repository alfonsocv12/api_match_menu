defmodule MatchMenuWeb.EmployeeRollView do
  use MatchMenuWeb, :view
  alias MatchMenuWeb.EmployeeRollView

  def render("index.json", %{employee_rolls: employee_rolls}) do
    %{data: render_many(employee_rolls, EmployeeRollView, "employee_roll.json")}
  end

end
