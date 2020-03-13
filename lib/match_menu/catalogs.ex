defmodule MatchMenu.Catalogs do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  import Ecto.Query, warn: false

  alias MatchMenu.Repo
  alias MatchMenu.Catalogs.EmployeeRole
  alias MatchMenu.Catalogs.Product
  alias MatchMenu.Catalogs.ProductType

  @doc """
  Returns the list of employee_role,
  ## Examples
    iex> list_employee_roles
    [%Employeerole{}, ...]
  """
  def list_employee_roles do
    Repo.all(from(role in Employeerole, where: role.role_name != "manager"))
  end

  @doc """
  Gets a single employee_role.
  Raises `Ecto.NoResultsError` if the Employeerole does not exist.
  ## Examples
      iex> get_employee_role!(123)
      %Employeerole{}
      iex> get_employee_role!(456)
      ** (Ecto.NoResultsError)
  """
  def get_employee_role!(id), do: Repo.get!(Employeerole, id)

  def get_employee_role(id), do: Repo.get(Employeerole, id)

  @doc """
  Creates a employee_role
  ## Examples
    iex> create_employee_role(%{field: value})
    {:ok, %Employeerole{}}
    iex> create_employee_role(%{field: value})
    {:error, %Ecto.Changeset{}}
  """
  def create_employee_role(attrs \\ %{}) do
    %Employeerole{}
    |>Employeerole.changeset(attrs)
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
    {:ok, %Employeerole{}}
    iex> create_resta_product(%field: value)
    {:error, %Employeerole{}}
  """
  def create_resta_product(attrs \\ %{}) do
    %Product{}
    |> Product.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Returns the list of employee_role,
  ## Examples
    iex> list_employee_roles
    [%Employeerole{}, ...]
  """
  def list_product_types do
    Repo.all(ProductType)
  end

  @doc """
  Gets a single employee_role.
  Raises `Ecto.NoResultsError` if the Employeerole does not exist.
  ## Examples
      iex> get_employee_role!(123)
      %Employeerole{}
      iex> get_employee_role!(456)
      ** (Ecto.NoResultsError)
  """
  def get_product_type(id), do: Repo.get(ProductType, id)

  @doc """
  Creates a restaurant_product
  ### Examples
    iex> create_resta_product(%field: value)
    {:ok, %Employeerole{}}
    iex> create_resta_product(%field: value)
    {:error, %Employeerole{}}
  """
  def create_product_type(attrs \\ %{}) do
    %ProductType{}
    |> ProductType.changeset(attrs)
    |> Repo.insert()
  end
end
