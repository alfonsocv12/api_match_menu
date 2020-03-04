defmodule MatchMenuWeb.RestaurantView do
  use MatchMenuWeb, :view
  alias MatchMenuWeb.RestaurantView

  def render("index.json", %{restaurants: restaurants}) do
    %{data: render_many(restaurants, RestaurantView, "restaurant.json")}
  end

  def render("show.json", %{restaurant: restaurant}) do
    %{data: render_one(restaurant, RestaurantView, "restaurant.json")}
  end

  def render("restaurant.json", %{restaurant: restaurant}) do
    %{id: restaurant.id,
      restaurant_alias: restaurant.restaurant_alias,
      name: restaurant.name,
      polyline: restaurant.polyline,
      logo: restaurant.logo,
      password_hash: restaurant.password_hash}
  end

  def render("jwt.json", %{jwt: jwt}) do
    %{jwt: jwt}
  end
end
