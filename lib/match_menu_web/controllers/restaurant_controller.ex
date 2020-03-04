defmodule MatchMenuWeb.RestaurantController do
  use MatchMenuWeb, :controller

  alias MatchMenu.Accounts
  alias MatchMenu.Accounts.Restaurant

  action_fallback MatchMenuWeb.FallbackController

  def index(conn, _params) do
    restaurants = Accounts.list_restaurants()
    render(conn, "index.json", restaurants: restaurants)
  end

  def create(conn, _params) do
    with {:ok, %Restaurant{} = restaurant} <- Accounts.create_restaurant(_params) do
      conn
      |> put_status(:created)
      |> render("show.json", restaurant: restaurant)
    end
  end

  def show(conn, %{"id" => id}) do
    restaurant = Accounts.get_restaurant!(id)
    render(conn, "show.json", restaurant: restaurant)
  end

  def update(conn, %{"id" => id, "restaurant" => restaurant_params}) do
    restaurant = Accounts.get_restaurant!(id)

    with {:ok, %Restaurant{} = restaurant} <- Accounts.update_restaurant(restaurant, restaurant_params) do
      render(conn, "show.json", restaurant: restaurant)
    end
  end

  def delete(conn, %{"id" => id}) do
    restaurant = Accounts.get_restaurant!(id)

    with {:ok, %Restaurant{}} <- Accounts.delete_restaurant(restaurant) do
      send_resp(conn, :no_content, "")
    end
  end
end
