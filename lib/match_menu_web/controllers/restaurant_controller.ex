defmodule MatchMenuWeb.RestaurantController do
  use MatchMenuWeb, :controller

  alias MatchMenu.Accounts
  alias MatchMenu.Accounts.Restaurant
  alias MatchMenu.RestaurantGuardian

  action_fallback MatchMenuWeb.FallbackController

  def index(conn, _params) do
    restaurants = Accounts.list_restaurants()
    render(conn, "index.json", restaurants: restaurants)
  end

  def create(conn, params) do
    with {:ok, %Restaurant{} = restaurant} <- Accounts.create_restaurant(params),
         {:ok, token, _claims} <- RestaurantGuardian.encode_and_sign(restaurant) do
      conn
      |> put_status(:created)
      |> render("jwt.json", jwt: token)
    end
  end

  def show(conn, _params) do
    restaurant = RestaurantGuardian.Plug.current_resource(conn)
    conn |> render("restaurant.json", restaurant: restaurant)
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

  def sign_in(conn, %{"restaurant_alias" => restaurant_alias, "password" => password}) do
    case Accounts.resta_token_sign_in(restaurant_alias, password) do
      {:ok, token, _claims} ->
        conn |> render("jwt.json", jwt: token)
      _ ->
        {:error, :unauthorized}
    end
  end
end
