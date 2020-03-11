defmodule MatchMenu.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false

  alias MatchMenu.Repo
  alias MatchMenu.Accounts.Restaurant
  alias MatchMenu.Accounts.User
  alias MatchMenu.Guardian
  alias MatchMenu.RestaurantGuardian


  @doc """
  Returns the list of users.
  ## Examples
      iex> list_users()
      [%User{}, ...]
  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.
  Raises `Ecto.NoResultsError` if the User does not exist.
  ## Examples
      iex> get_user!(123)
      %User{}
      iex> get_user!(456)
      ** (Ecto.NoResultsError)
  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.
  ## Examples
      iex> create_user(%{field: value})
      {:ok, %User{}}
      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.
  ## Examples
      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}
      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.
  ## Examples
      iex> delete_user(user)
      {:ok, %User{}}
      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}
  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.
  ## Examples
      iex> change_user(user)
      %Ecto.Changeset{source: %User{}}
  """
  def change_user(%User{} = user) do
    User.changeset(user, %{})
  end

  @doc """
  We start the authentication for users here
  """
  def token_sign_in(email, password) do
      case email_password_auth(email, password) do
        {:ok, user} ->
          Guardian.encode_and_sign(user)
        _ ->
          {:error, :unauthorized}
      end
  end

  defp email_password_auth(email, password) when is_binary(email) and is_binary(password) do
      with {:ok, user} <- get_by_email(email),
      do: verify_password(password, user)
  end

  defp get_by_email(email) when is_binary(email) do
    case Repo.get_by(User, email: email) do
      nil ->
        Bcrypt.dummy_checkpw()
        {:error, "Login error."}
      user ->
        {:ok, user}
    end
  end

  defp verify_password(password, %User{} = user) when is_binary(password) do
    if Bcrypt.verify_pass(password, user.password_hash) do
      {:ok, user}
    else
      {:error, :invalid_password}
    end
  end


  @doc """
  Returns the list of restaurants.
  ## Examples
      iex> list_restaurants()
      [%Restaurant{}, ...]
  """
  def list_restaurants do
    Repo.all(Restaurant)
  end

  @doc """
  Gets a single restaurant.
  Raises `Ecto.NoResultsError` if the Restaurant does not exist.
  ## Examples
      iex> get_restaurant!(123)
      %Restaurant{}
      iex> get_restaurant!(456)
      ** (Ecto.NoResultsError)
  """
  def get_restaurant!(id), do: Repo.get!(Restaurant, id)

  @doc """
  Creates a restaurant.
  ## Examples
      iex> create_restaurant(%{field: value})
      {:ok, %Restaurant{}}
      iex> create_restaurant(%{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def create_restaurant(attrs \\ %{}) do
    %Restaurant{}
    |> Restaurant.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a restaurant.
  ## Examples
      iex> update_restaurant(restaurant, %{field: new_value})
      {:ok, %Restaurant{}}
      iex> update_restaurant(restaurant, %{field: bad_value})
      {:error, %Ecto.Changeset{}}
  """
  def update_restaurant(%Restaurant{} = restaurant, attrs) do
    restaurant
    |> Restaurant.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a restaurant.
  ## Examples
      iex> delete_restaurant(restaurant)
      {:ok, %Restaurant{}}
      iex> delete_restaurant(restaurant)
      {:error, %Ecto.Changeset{}}
  """
  def delete_restaurant(%Restaurant{} = restaurant) do
    Repo.delete(restaurant)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking restaurant changes.
  ## Examples
      iex> change_restaurant(restaurant)
      %Ecto.Changeset{source: %Restaurant{}}
  """
  def change_restaurant(%Restaurant{} = restaurant) do
    Restaurant.changeset(restaurant, %{})
  end

  @doc """
  We start the authentication for restaurants here
  """
  def resta_token_sign_in(restaurant_alias, password) do
      case alias_password_auth(restaurant_alias, password) do
        {:ok, restaurant} ->
          RestaurantGuardian.encode_and_sign(restaurant)
        _ ->
          {:error, :unauthorized}
      end
  end

  defp alias_password_auth(restaurant_alias, password) when is_binary(restaurant_alias) and is_binary(password) do
      with {:ok, restaurant} <- get_by_restaurant_alias(restaurant_alias),
      do: verify_password_resta(password, restaurant)
  end

  defp get_by_restaurant_alias(restaurant_alias) when is_binary(restaurant_alias) do
    case Repo.get_by(Restaurant, restaurant_alias: restaurant_alias) do
      nil ->
        Bcrypt.dummy_checkpw()
        {:error, "Login error."}
      restaurant ->
        {:ok, restaurant}
    end
  end

  defp verify_password_resta(password, %Restaurant{} = restaurant) when is_binary(password) do
    if Bcrypt.verify_pass(password, restaurant.password_hash) do
      {:ok, restaurant}
    else
      {:error, :invalid_password}
    end
  end


  alias MatchMenu.Accounts.Employee

  @doc """
  Returns the list of employees.

  ## Examples

      iex> list_employees()
      [%Employee{}, ...]

  """
  def list_employees do
    Repo.all(Employee)
  end

  @doc """
  Gets a single employee.

  Raises `Ecto.NoResultsError` if the Employee does not exist.

  ## Examples

      iex> get_employee!(123)
      %Employee{}

      iex> get_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_employee!(id), do: Repo.get!(Employee, id)

  @doc """
  Creates a employee.

  ## Examples

      iex> create_employee(%{field: value})
      {:ok, %Employee{}}

      iex> create_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_employee(attrs \\ %{}) do
    %Employee{}
    |> Employee.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a employee.

  ## Examples

      iex> update_employee(employee, %{field: new_value})
      {:ok, %Employee{}}

      iex> update_employee(employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_employee(%Employee{} = employee, attrs) do
    employee
    |> Employee.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a employee.

  ## Examples

      iex> delete_employee(employee)
      {:ok, %Employee{}}

      iex> delete_employee(employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_employee(%Employee{} = employee) do
    Repo.delete(employee)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking employee changes.

  ## Examples

      iex> change_employee(employee)
      %Ecto.Changeset{source: %Employee{}}

  """
  def change_employee(%Employee{} = employee) do
    Employee.changeset(employee, %{})
  end

  @doc """
  We start the authentication for restaurants here
  """

  def employee_token_sign_in(employee_alias, password) do
      case employee_alias_password_auth(employee_alias, password) do
        {:ok, restaurant} ->
          RestaurantGuardian.encode_and_sign(restaurant)
        _ ->
          {:error, :unauthorized}
      end
  end

  defp employee_alias_password_auth(employee_alias, password) when is_binary(employee_alias) and is_binary(password) do
      with {:ok, employee} <- get_by_employee_alias(employee_alias),
      do: verify_password_employee(password, employee)
  end

  defp get_by_employee_alias(employee_alias) when is_binary(employee_alias) do
    case Repo.get_by(Employee, employee_alias: employee_alias) do
      nil ->
        Bcrypt.dummy_checkpw()
        {:error, "Login error."}
      employee ->
        {:ok, employee}
    end
  end

  defp verify_password_employee(password, %Employee{} = employee) when is_binary(password) do
    if Bcrypt.verify_pass(password, employee.password_hash) do
      {:ok, employee}
    else
      {:error, :invalid_password}
    end
  end
end
