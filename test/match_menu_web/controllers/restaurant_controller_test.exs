defmodule MatchMenuWeb.RestaurantControllerTest do
  use MatchMenuWeb.ConnCase

  alias MatchMenu.Accounts
  alias MatchMenu.Accounts.Restaurant

  @create_attrs %{
    alias: "some alias",
    logo: "some logo",
    name: "some name",
    password_hash: "some password_hash",
    polyline: "some polyline"
  }
  @update_attrs %{
    alias: "some updated alias",
    logo: "some updated logo",
    name: "some updated name",
    password_hash: "some updated password_hash",
    polyline: "some updated polyline"
  }
  @invalid_attrs %{alias: nil, logo: nil, name: nil, password_hash: nil, polyline: nil}

  def fixture(:restaurant) do
    {:ok, restaurant} = Accounts.create_restaurant(@create_attrs)
    restaurant
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all restaurants", %{conn: conn} do
      conn = get(conn, Routes.restaurant_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create restaurant" do
    test "renders restaurant when data is valid", %{conn: conn} do
      conn = post(conn, Routes.restaurant_path(conn, :create), restaurant: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.restaurant_path(conn, :show, id))

      assert %{
               "id" => id,
               "alias" => "some alias",
               "logo" => "some logo",
               "name" => "some name",
               "password_hash" => "some password_hash",
               "polyline" => "some polyline"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.restaurant_path(conn, :create), restaurant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update restaurant" do
    setup [:create_restaurant]

    test "renders restaurant when data is valid", %{conn: conn, restaurant: %Restaurant{id: id} = restaurant} do
      conn = put(conn, Routes.restaurant_path(conn, :update, restaurant), restaurant: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.restaurant_path(conn, :show, id))

      assert %{
               "id" => id,
               "alias" => "some updated alias",
               "logo" => "some updated logo",
               "name" => "some updated name",
               "password_hash" => "some updated password_hash",
               "polyline" => "some updated polyline"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, restaurant: restaurant} do
      conn = put(conn, Routes.restaurant_path(conn, :update, restaurant), restaurant: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete restaurant" do
    setup [:create_restaurant]

    test "deletes chosen restaurant", %{conn: conn, restaurant: restaurant} do
      conn = delete(conn, Routes.restaurant_path(conn, :delete, restaurant))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.restaurant_path(conn, :show, restaurant))
      end
    end
  end

  defp create_restaurant(_) do
    restaurant = fixture(:restaurant)
    {:ok, restaurant: restaurant}
  end
end
