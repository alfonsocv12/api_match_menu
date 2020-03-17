defmodule MatchMenuWeb.TableControllerTest do
  use MatchMenuWeb.ConnCase

  alias MatchMenu.Tables
  alias MatchMenu.Tables.Table

  @create_attrs %{
    description: "some description",
    name: "some name",
    restaurant_id: 42,
    size: 42
  }
  @update_attrs %{
    description: "some updated description",
    name: "some updated name",
    restaurant_id: 43,
    size: 43
  }
  @invalid_attrs %{description: nil, name: nil, restaurant_id: nil, size: nil}

  def fixture(:table) do
    {:ok, table} = Tables.create_table(@create_attrs)
    table
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all tables", %{conn: conn} do
      conn = get(conn, Routes.table_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create table" do
    test "renders table when data is valid", %{conn: conn} do
      conn = post(conn, Routes.table_path(conn, :create), table: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.table_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "name" => "some name",
               "restaurant_id" => 42,
               "size" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.table_path(conn, :create), table: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update table" do
    setup [:create_table]

    test "renders table when data is valid", %{conn: conn, table: %Table{id: id} = table} do
      conn = put(conn, Routes.table_path(conn, :update, table), table: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.table_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "name" => "some updated name",
               "restaurant_id" => 43,
               "size" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, table: table} do
      conn = put(conn, Routes.table_path(conn, :update, table), table: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete table" do
    setup [:create_table]

    test "deletes chosen table", %{conn: conn, table: table} do
      conn = delete(conn, Routes.table_path(conn, :delete, table))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.table_path(conn, :show, table))
      end
    end
  end

  defp create_table(_) do
    table = fixture(:table)
    {:ok, table: table}
  end
end
