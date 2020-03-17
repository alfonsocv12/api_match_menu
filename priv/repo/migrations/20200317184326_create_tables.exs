defmodule MatchMenu.Repo.Migrations.CreateTables do
  use Ecto.Migration

  def change do
    create table(:tables) do
      add :restaurant_id, references(:restaurants)
      add :name, :string
      add :size, :integer
      add :description, :string

      timestamps()
      add :soft_delete, :boolean, default: false, null: false
    end

  end
end
