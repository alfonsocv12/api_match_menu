defmodule MatchMenu.ProductosTest do
  use MatchMenu.DataCase

  alias MatchMenu.Productos

  describe "productos" do
    alias MatchMenu.Productos.Producto

    @valid_attrs %{name: "some name", price: 120.5, restaurant_id: 42}
    @update_attrs %{name: "some updated name", price: 456.7, restaurant_id: 43}
    @invalid_attrs %{name: nil, price: nil, restaurant_id: nil}

    def producto_fixture(attrs \\ %{}) do
      {:ok, producto} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Productos.create_producto()

      producto
    end

    test "list_productos/0 returns all productos" do
      producto = producto_fixture()
      assert Productos.list_productos() == [producto]
    end

    test "get_producto!/1 returns the producto with given id" do
      producto = producto_fixture()
      assert Productos.get_producto!(producto.id) == producto
    end

    test "create_producto/1 with valid data creates a producto" do
      assert {:ok, %Producto{} = producto} = Productos.create_producto(@valid_attrs)
      assert producto.name == "some name"
      assert producto.price == 120.5
      assert producto.restaurant_id == 42
    end

    test "create_producto/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Productos.create_producto(@invalid_attrs)
    end

    test "update_producto/2 with valid data updates the producto" do
      producto = producto_fixture()
      assert {:ok, %Producto{} = producto} = Productos.update_producto(producto, @update_attrs)
      assert producto.name == "some updated name"
      assert producto.price == 456.7
      assert producto.restaurant_id == 43
    end

    test "update_producto/2 with invalid data returns error changeset" do
      producto = producto_fixture()
      assert {:error, %Ecto.Changeset{}} = Productos.update_producto(producto, @invalid_attrs)
      assert producto == Productos.get_producto!(producto.id)
    end

    test "delete_producto/1 deletes the producto" do
      producto = producto_fixture()
      assert {:ok, %Producto{}} = Productos.delete_producto(producto)
      assert_raise Ecto.NoResultsError, fn -> Productos.get_producto!(producto.id) end
    end

    test "change_producto/1 returns a producto changeset" do
      producto = producto_fixture()
      assert %Ecto.Changeset{} = Productos.change_producto(producto)
    end
  end
end
