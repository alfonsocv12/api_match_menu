defmodule MatchMenu.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employee_roles) do
        add :role_name, :string

        timestamps()
    end

    create table(:employees) do
      add :employee_alias, :string
      add :name, :string
      add :password_hash, :string
      add :restaurant_id, references(:restaurants)
      add :role_id, references(:employee_roles)

      timestamps()
    end

    create unique_index(:employees, [:employee_alias])
    create unique_index(:employee_roles, [:role_name])
  end
end
