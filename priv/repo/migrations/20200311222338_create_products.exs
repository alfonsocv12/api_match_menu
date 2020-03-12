defmodule MatchMenu.Repo.Migrations.CreateProducts do
  use Ecto.Migration

  def change do

    create table(:product_types) do
      add :product_type_name, :string

      timestamps()
    end

    create table(:products) do
      add :name, :string
      add :description, :string
      add :price, :float
      add :product_type_id, references(:product_types)
      add :restaurant_id, references(:restaurants)

      timestamps()
      add :soft_delete, :boolean, default: false, null: false
    end

    create unique_index(:product_types, [:product_type_name])
  end
end
