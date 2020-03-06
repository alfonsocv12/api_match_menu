defmodule MatchMenu.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employee_roll) do
        add :roll_name, :string

        timestamps()
    end

    create table(:employees) do
      add :employee_alias, :string
      add :name, :string
      add :password_hash, :string
      add :restaurante_id, references(:restaurants)
      add :roll_id, references(:employee_roll)

      timestamps()
    end

    create unique_index(:employees, [:employee_alias])
  end
end
