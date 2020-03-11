defmodule MatchMenu.Catalogs do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false
  import Ecto.Query, warn: false

  alias MatchMenu.Repo
  alias MatchMenu.Catalogs.EmployeeRoll

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

  @doc """
  Creates a employee_roll
  ## Examples
    iex> create_employee_roll(%{field: value})
    {:ok, %EmployeeRoll{}}
    iex> create_employee_roll(%{field: value})
    {:error, %Ecto.Changeset{}}
  """
  def create_employee_roll(attrs \\ %{}) do
    require Logger
    Logger.debug("No se porque esta aqui")
    %EmployeeRoll{}
    |>EmployeeRoll.changeset(attrs)
    |>Repo.insert()
  end
end
