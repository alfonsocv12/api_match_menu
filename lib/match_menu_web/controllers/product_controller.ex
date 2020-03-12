defmodule MatchMenuWeb.ProductController do
  use MatchMenuWeb, :controller

  alias MatchMenu.Catalogs
  alias MatchMenu.Catalogs.Product
  alias MatchMenu.RestaurantGuardian

  action_fallback MatchMenuWeb.FallbackController

  def create_resta_product(conn, %{"product" => product_params}) do
    restaurant = RestaurantGuardian.Plug.current_resource(conn)
    product_map = Map.put(product_params, "restaurant_id", restaurant.id)
    with {:ok,
      %Product{} = product} <- Catalogs.create_resta_product(product_map) do
      conn
        |> put_status(:created)
        |> render("show.json", product: product)
    end
  end

  def restaurant_products(conn, %{"restaurant_id" => id}) do
    products = Catalogs.list_restaurant_products(id)
    render(conn, "index.json", products: products)
  end

  # def show(conn, %{"id" => id}) do
  #   product = Catalogs.get_product!(id)
  #   render(conn, "show.json", product: product)
  # end
  #
  # def update(conn, %{"id" => id, "product" => product_params}) do
  #   product = Catalogs.get_product!(id)
  #
  #   with {:ok, %Product{} = product} <- Catalogs.update_product(product, product_params) do
  #     render(conn, "show.json", product: product)
  #   end
  # end
  #
  # def delete(conn, %{"id" => id}) do
  #   product = Catalogs.get_product!(id)
  #
  #   with {:ok, %Product{}} <- Catalogs.delete_product(product) do
  #     send_resp(conn, :no_content, "")
  #   end
  # end
end
