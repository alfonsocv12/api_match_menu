defmodule MatchMenuWeb.ProductTypeView do
  use MatchMenuWeb, :view
  alias MatchMenuWeb.ProductTypeView

  def render("index.json", %{product_types: product_types}) do
    %{data: render_many(product_types, ProductTypeView, "product_type.json")}
  end

  def render("show.json", %{product_type: product_type}) do
    %{data: render_one(product_type, ProductTypeView, "product_type.json")}
  end

  def render("product_type.json", %{product_type: product_type}) do
    %{
      id: product_type.id,
      product_type_name: product_type.product_type_name}
  end
end
