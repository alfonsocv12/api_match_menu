defmodule MatchMenuWeb.ProductoView do
  use MatchMenuWeb, :view
  alias MatchMenuWeb.ProductoView

  def render("index.json", %{productos: productos}) do
    %{data: render_many(productos, ProductoView, "producto.json")}
  end

  def render("show.json", %{producto: producto}) do
    %{data: render_one(producto, ProductoView, "producto.json")}
  end

  def render("producto.json", %{producto: producto}) do
    %{id: producto.id,
      name: producto.name,
      price: producto.price,
      restaurant_id: producto.restaurant_id}
  end
end
