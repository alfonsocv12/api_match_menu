defmodule MatchMenu.Repo.Migrations.CreateProductos do
  use Ecto.Migration

  def change do
    create table(:productos) do
      add :name, :string
      add :price, :float
      add :restaurant_id, references('restaurants')

      timestamps()
    end

  end
end
