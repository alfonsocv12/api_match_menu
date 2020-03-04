defmodule MatchMenu.Repo.Migrations.CreateRestaurants do
  use Ecto.Migration

  def change do
    create table(:restaurants) do
      add :restaurant_alias, :string
      add :name, :string
      add :polyline, :string
      add :logo, :string
      add :password_hash, :string

      timestamps()
    end

    create unique_index(:restaurants, [:user_alias])
  end
end
