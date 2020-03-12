defmodule MatchMenu.Catalogs do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  import Ecto.Query, warn: false

  alias MatchMenu.Repo
  alias MatchMenu.Catalogs.EmployeeRoll
  alias MatchMenu.Catalogs.Product
  alias MatchMenu.Catalogs.ProductType

  @doc """
  Returns the list of employee_roll,
  ## Examples
    iex> list_employee_rolls
    [%EmployeeRoll{}, ...]
  """
  def list_employee_rolls do
    Repo.all(from(roll in EmployeeRoll, where: roll.roll_name != "manager"))
  end

  @doc """
  Gets a single employee_roll.
  Raises `Ecto.NoResultsError` if the EmployeeRoll does not exist.
  ## Examples
      iex> get_employee_roll!(123)
      %EmployeeRoll{}
      iex> get_employee_roll!(456)
      ** (Ecto.NoResultsError)
  """
  def get_employee_roll!(id), do: Repo.get!(EmployeeRoll, id)

  def get_employee_roll(id), do: Repo.get(EmployeeRoll, id)

  @doc """
  Creates a employee_roll
  ## Examples
    iex> create_employee_roll(%{field: value})
    {:ok, %EmployeeRoll{}}
    iex> create_employee_roll(%{field: value})
    {:error, %Ecto.Changeset{}}
  """
  def create_employee_roll(attrs \\ %{}) do
    %EmployeeRoll{}
    |>EmployeeRoll.changeset(attrs)
    |>Repo.insert()
  end

  @doc """
  Returns the list of restaurant_products
  ### Examples
    iex> list_restaurant_products
    [%Product{}, ...]
  """
  def list_restaurant_products(id) do
    Repo.all(from(product in Product, where: product.restaurant_id == ^id,
      where: product.soft_delete == false))
  end

  @doc """
  Creates a restaurant_product
  ### Examples
    iex> create_resta_product(%field: value)
    {:ok, %EmployeeRoll{}}
    iex> create_resta_product(%field: value)
    {:error, %EmployeeRoll{}}
  """
  def create_resta_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns the list of employee_roll,
  ## Examples
    iex> list_employee_rolls
    [%EmployeeRoll{}, ...]
  """
  def list_product_types do
    Repo.all(ProductType)
  end

  @doc """
  Gets a single employee_roll.
  Raises `Ecto.NoResultsError` if the EmployeeRoll does not exist.
  ## Examples
      iex> get_employee_roll!(123)
      %EmployeeRoll{}
      iex> get_employee_roll!(456)
      ** (Ecto.NoResultsError)
  """
  def get_product_type(id), do: Repo.get(ProductType, id)

  @doc """
  Creates a restaurant_product
  ### Examples
    iex> create_resta_product(%field: value)
    {:ok, %EmployeeRoll{}}
    iex> create_resta_product(%field: value)
    {:error, %EmployeeRoll{}}
  """
  def create_product_type(attrs \\ %{}) do
    %ProductType{}
    |> ProductType.changeset(attrs)
    |> Repo.insert()
  end
end
