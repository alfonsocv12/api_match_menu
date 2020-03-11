defmodule MatchMenu.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employee_rolls) do
        add :roll_name, :string

        timestamps()
    end

    create table(:employees) do
      add :employee_alias, :string
      add :name, :string
      add :password_hash, :string
      add :restaurant_id, references(:restaurants)
      add :roll_id, references(:employee_rolls)

      timestamps()
    end

    create unique_index(:employees, [:employee_alias])
    create unique_index(:employee_rolls, [:roll_name])
  end
end
