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
  alias MatchMenu.Catalogs

  employee_roll_list = [
    %{id:1, roll_name: "manager"},
    %{id:2, roll_name: "waiter"},
    %{id:3, roll_name: "hostest"},
    %{id:4, roll_name: "chef"}
  ]

  try do
    Enum.each(employee_roll_list, fn(data) ->
      Catalogs.create_employee_roll(data)
    end)
  rescue
    IO.puts("Allready seed")
  end
end
