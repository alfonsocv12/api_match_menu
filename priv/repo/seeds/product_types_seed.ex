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

  product_types = [
    %{id: 1, product_type_name: "Beverages"},
    %{id: 2, product_type_name: "Breakfast"},
    %{id: 3, product_type_name: "appetizer"},
    %{id: 4, product_type_name: "main course"},
    %{id: 5, product_type_name: "dessert"}
  ]

  try do
    Enum.each product_types, fn(data) ->
      Catalogs.create_product_type(data)
    end
  catch _ ->
    IO.puts("Allready seed")
  end
end
