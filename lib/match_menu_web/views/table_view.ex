defmodule MatchMenuWeb.TableView do
  use MatchMenuWeb, :view
  alias MatchMenuWeb.TableView

  def render("index.json", %{tables: tables}) do
    %{data: render_many(tables, TableView, "table.json")}
  end

  def render("show.json", %{table: table}) do
    %{data: render_one(table, TableView, "table.json")}
  end

  def render("table.json", %{table: table}) do
    %{id: table.id,
      restaurant_id: table.restaurant_id,
      name: table.name,
      size: table.size,
      description: table.description}
  end
end
