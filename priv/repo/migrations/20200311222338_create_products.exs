defmodule MatchMenu.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do
    create table(:products) do
      add :name, :string
      add :description, :string
      add :price, :float
      add :restaurant_id, references(:restaurants)

      timestamps()
      add :soft_delete, :boolean, default: false, null: false
    end

  end
end
