defmodule MatchMenu.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:tables) do
      add :restaurant_id, :integer
      add :name, :string
      add :size, :integer
      add :description, :string

      timestamps()
    end

  end
end
