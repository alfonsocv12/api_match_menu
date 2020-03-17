defmodule MatchMenu.TablesTest do
  use MatchMenu.DataCase

  alias MatchMenu.Tables

  describe "tables" do
    alias MatchMenu.Tables.Table

    @valid_attrs %{description: "some description", name: "some name", restaurant_id: 42, size: 42}
    @update_attrs %{description: "some updated description", name: "some updated name", restaurant_id: 43, size: 43}
    @invalid_attrs %{description: nil, name: nil, restaurant_id: nil, size: nil}

    def table_fixture(attrs \\ %{}) do
      {:ok, table} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Tables.create_table()

      table
    end

    test "list_tables/0 returns all tables" do
      table = table_fixture()
      assert Tables.list_tables() == [table]
    end

    test "get_table!/1 returns the table with given id" do
      table = table_fixture()
      assert Tables.get_table!(table.id) == table
    end

    test "create_table/1 with valid data creates a table" do
      assert {:ok, %Table{} = table} = Tables.create_table(@valid_attrs)
      assert table.description == "some description"
      assert table.name == "some name"
      assert table.restaurant_id == 42
      assert table.size == 42
    end

    test "create_table/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Tables.create_table(@invalid_attrs)
    end

    test "update_table/2 with valid data updates the table" do
      table = table_fixture()
      assert {:ok, %Table{} = table} = Tables.update_table(table, @update_attrs)
      assert table.description == "some updated description"
      assert table.name == "some updated name"
      assert table.restaurant_id == 43
      assert table.size == 43
    end

    test "update_table/2 with invalid data returns error changeset" do
      table = table_fixture()
      assert {:error, %Ecto.Changeset{}} = Tables.update_table(table, @invalid_attrs)
      assert table == Tables.get_table!(table.id)
    end

    test "delete_table/1 deletes the table" do
      table = table_fixture()
      assert {:ok, %Table{}} = Tables.delete_table(table)
      assert_raise Ecto.NoResultsError, fn -> Tables.get_table!(table.id) end
    end

    test "change_table/1 returns a table changeset" do
      table = table_fixture()
      assert %Ecto.Changeset{} = Tables.change_table(table)
    end
  end
end
