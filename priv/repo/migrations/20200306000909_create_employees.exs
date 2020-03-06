defmodule MatchMenu.Repo.Migrations.CreateEmployees do
  use Ecto.Migration

  def change do
    create table(:employees) do
      add :employee_alias, :string
      add :name, :string
      add :password_hash, :string
      add :restaurante_id, :integer
      add :roll_id, :integer

      timestamps()
    end

    create unique_index(:employees, [:employee_alias])
  end
end
