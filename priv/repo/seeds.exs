# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     MatchMenu.Repo.insert!(%MatchMenu.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.
defmodule MatchMenu.DatabaseSeeder do
  alias MatchMenu.Repo
  alias MatchMenu.EmployeeRoll

  @employee_roll_list ["Gerente", "Mesero", "Hostest"]
end
