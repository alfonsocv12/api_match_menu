defmodule MatchMenuWeb.EmployeeControllerTest do
  use MatchMenuWeb.ConnCase

  alias MatchMenu.Accounts
  alias MatchMenu.Accounts.Employee

  @create_attrs %{
    employee_alias: "some employee_alias",
    name: "some name",
    password_hash: "some password_hash",
    restaurant_id: 42,
    roll_id: 42
  }
  @update_attrs %{
    employee_alias: "some updated employee_alias",
    name: "some updated name",
    password_hash: "some updated password_hash",
    restaurant_id: 43,
    roll_id: 43
  }
  @invalid_attrs %{employee_alias: nil, name: nil, password_hash: nil, restaurant_id: nil, roll_id: nil}

  def fixture(:employee) do
    {:ok, employee} = Accounts.create_employee(@create_attrs)
    employee
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all employees", %{conn: conn} do
      conn = get(conn, Routes.employee_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create employee" do
    test "renders employee when data is valid", %{conn: conn} do
      conn = post(conn, Routes.employee_path(conn, :create), employee: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.employee_path(conn, :show, id))

      assert %{
               "id" => id,
               "employee_alias" => "some employee_alias",
               "name" => "some name",
               "password_hash" => "some password_hash",
               "restaurant_id" => 42,
               "roll_id" => 42
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.employee_path(conn, :create), employee: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update employee" do
    setup [:create_employee]

    test "renders employee when data is valid", %{conn: conn, employee: %Employee{id: id} = employee} do
      conn = put(conn, Routes.employee_path(conn, :update, employee), employee: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.employee_path(conn, :show, id))

      assert %{
               "id" => id,
               "employee_alias" => "some updated employee_alias",
               "name" => "some updated name",
               "password_hash" => "some updated password_hash",
               "restaurant_id" => 43,
               "roll_id" => 43
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, employee: employee} do
      conn = put(conn, Routes.employee_path(conn, :update, employee), employee: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete employee" do
    setup [:create_employee]

    test "deletes chosen employee", %{conn: conn, employee: employee} do
      conn = delete(conn, Routes.employee_path(conn, :delete, employee))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.employee_path(conn, :show, employee))
      end
    end
  end

  defp create_employee(_) do
    employee = fixture(:employee)
    {:ok, employee: employee}
  end
end
