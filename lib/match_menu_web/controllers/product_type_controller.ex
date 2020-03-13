defmodule MatchMenuWeb.ProductTypeController do
  use MatchMenuWeb, :controller

  alias MatchMenu.Catalogs
  alias MatchMenu.Catalogs.ProductType
  alias MatchMenu.RestaurantGuardian

  action_fallback MatchMenuWeb.FallbackController

  def index(conn, _params) do
    product_types = Catalogs.list_product_types()
    render(conn, "index.json", product_types: product_types)
  end
end
