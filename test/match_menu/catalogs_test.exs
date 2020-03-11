defmodule MatchMenu.CatalogsTest do
  use MatchMenu.DataCase

  alias MatchMenu.Catalogs

  describe "products" do
    alias MatchMenu.Catalogs.Product

    @valid_attrs %{description: "some description", name: "some name", price: 120.5, restaurant_id: 42, soft_delete: true}
    @update_attrs %{description: "some updated description", name: "some updated name", price: 456.7, restaurant_id: 43, soft_delete: false}
    @invalid_attrs %{description: nil, name: nil, price: nil, restaurant_id: nil, soft_delete: nil}

    def product_fixture(attrs \\ %{}) do
      {:ok, product} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Catalogs.create_product()

      product
    end

    test "list_products/0 returns all products" do
      product = product_fixture()
      assert Catalogs.list_products() == [product]
    end

    test "get_product!/1 returns the product with given id" do
      product = product_fixture()
      assert Catalogs.get_product!(product.id) == product
    end

    test "create_product/1 with valid data creates a product" do
      assert {:ok, %Product{} = product} = Catalogs.create_product(@valid_attrs)
      assert product.description == "some description"
      assert product.name == "some name"
      assert product.price == 120.5
      assert product.restaurant_id == 42
      assert product.soft_delete == true
    end

    test "create_product/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Catalogs.create_product(@invalid_attrs)
    end

    test "update_product/2 with valid data updates the product" do
      product = product_fixture()
      assert {:ok, %Product{} = product} = Catalogs.update_product(product, @update_attrs)
      assert product.description == "some updated description"
      assert product.name == "some updated name"
      assert product.price == 456.7
      assert product.restaurant_id == 43
      assert product.soft_delete == false
    end

    test "update_product/2 with invalid data returns error changeset" do
      product = product_fixture()
      assert {:error, %Ecto.Changeset{}} = Catalogs.update_product(product, @invalid_attrs)
      assert product == Catalogs.get_product!(product.id)
    end

    test "delete_product/1 deletes the product" do
      product = product_fixture()
      assert {:ok, %Product{}} = Catalogs.delete_product(product)
      assert_raise Ecto.NoResultsError, fn -> Catalogs.get_product!(product.id) end
    end

    test "change_product/1 returns a product changeset" do
      product = product_fixture()
      assert %Ecto.Changeset{} = Catalogs.change_product(product)
    end
  end
end
