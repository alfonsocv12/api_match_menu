defmodule MatchMenu.AccountsTest do
  use MatchMenu.DataCase

  alias MatchMenu.Accounts

  describe "users" do
    alias MatchMenu.Accounts.User

    @valid_attrs %{email: "some email", password_hash: "some password_hash"}
    @update_attrs %{email: "some updated email", password_hash: "some updated password_hash"}
    @invalid_attrs %{email: nil, password_hash: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.password_hash == "some password_hash"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.password_hash == "some updated password_hash"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end

  describe "restaurants" do
    alias MatchMenu.Accounts.Restaurant

    @valid_attrs %{alias: "some alias", logo: "some logo", name: "some name", password_hash: "some password_hash", polyline: "some polyline"}
    @update_attrs %{alias: "some updated alias", logo: "some updated logo", name: "some updated name", password_hash: "some updated password_hash", polyline: "some updated polyline"}
    @invalid_attrs %{alias: nil, logo: nil, name: nil, password_hash: nil, polyline: nil}

    def restaurant_fixture(attrs \\ %{}) do
      {:ok, restaurant} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_restaurant()

      restaurant
    end

    test "list_restaurants/0 returns all restaurants" do
      restaurant = restaurant_fixture()
      assert Accounts.list_restaurants() == [restaurant]
    end

    test "get_restaurant!/1 returns the restaurant with given id" do
      restaurant = restaurant_fixture()
      assert Accounts.get_restaurant!(restaurant.id) == restaurant
    end

    test "create_restaurant/1 with valid data creates a restaurant" do
      assert {:ok, %Restaurant{} = restaurant} = Accounts.create_restaurant(@valid_attrs)
      assert restaurant.alias == "some alias"
      assert restaurant.logo == "some logo"
      assert restaurant.name == "some name"
      assert restaurant.password_hash == "some password_hash"
      assert restaurant.polyline == "some polyline"
    end

    test "create_restaurant/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_restaurant(@invalid_attrs)
    end

    test "update_restaurant/2 with valid data updates the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{} = restaurant} = Accounts.update_restaurant(restaurant, @update_attrs)
      assert restaurant.alias == "some updated alias"
      assert restaurant.logo == "some updated logo"
      assert restaurant.name == "some updated name"
      assert restaurant.password_hash == "some updated password_hash"
      assert restaurant.polyline == "some updated polyline"
    end

    test "update_restaurant/2 with invalid data returns error changeset" do
      restaurant = restaurant_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_restaurant(restaurant, @invalid_attrs)
      assert restaurant == Accounts.get_restaurant!(restaurant.id)
    end

    test "delete_restaurant/1 deletes the restaurant" do
      restaurant = restaurant_fixture()
      assert {:ok, %Restaurant{}} = Accounts.delete_restaurant(restaurant)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_restaurant!(restaurant.id) end
    end

    test "change_restaurant/1 returns a restaurant changeset" do
      restaurant = restaurant_fixture()
      assert %Ecto.Changeset{} = Accounts.change_restaurant(restaurant)
    end
  end

  describe "employees" do
    alias MatchMenu.Accounts.Employee

    @valid_attrs %{employee_alias: "some employee_alias", name: "some name", password_hash: "some password_hash", restaurant_id: 42, roll_id: 42}
    @update_attrs %{employee_alias: "some updated employee_alias", name: "some updated name", password_hash: "some updated password_hash", restaurant_id: 43, roll_id: 43}
    @invalid_attrs %{employee_alias: nil, name: nil, password_hash: nil, restaurant_id: nil, roll_id: nil}

    def employee_fixture(attrs \\ %{}) do
      {:ok, employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_employee()

      employee
    end

    test "list_employees/0 returns all employees" do
      employee = employee_fixture()
      assert Accounts.list_employees() == [employee]
    end

    test "get_employee!/1 returns the employee with given id" do
      employee = employee_fixture()
      assert Accounts.get_employee!(employee.id) == employee
    end

    test "create_employee/1 with valid data creates a employee" do
      assert {:ok, %Employee{} = employee} = Accounts.create_employee(@valid_attrs)
      assert employee.employee_alias == "some employee_alias"
      assert employee.name == "some name"
      assert employee.password_hash == "some password_hash"
      assert employee.restaurant_id == 42
      assert employee.roll_id == 42
    end

    test "create_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_employee(@invalid_attrs)
    end

    test "update_employee/2 with valid data updates the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{} = employee} = Accounts.update_employee(employee, @update_attrs)
      assert employee.employee_alias == "some updated employee_alias"
      assert employee.name == "some updated name"
      assert employee.password_hash == "some updated password_hash"
      assert employee.restaurant_id == 43
      assert employee.roll_id == 43
    end

    test "update_employee/2 with invalid data returns error changeset" do
      employee = employee_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_employee(employee, @invalid_attrs)
      assert employee == Accounts.get_employee!(employee.id)
    end

    test "delete_employee/1 deletes the employee" do
      employee = employee_fixture()
      assert {:ok, %Employee{}} = Accounts.delete_employee(employee)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_employee!(employee.id) end
    end

    test "change_employee/1 returns a employee changeset" do
      employee = employee_fixture()
      assert %Ecto.Changeset{} = Accounts.change_employee(employee)
    end
  end
end
