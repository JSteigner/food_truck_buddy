defmodule FoodTruckBuddy.Repo.Migrations.CreateFoodTrucksTable do
  use Ecto.Migration

  def change do
    create table(:food_trucks) do
      add(:name, :string)
      add(:type, :string)
      add(:location_area, :string)
      add(:address, :string)
      add(:zip_code, :string)
      add(:status, :string)
      add(:food_items, :string)
      add(:latitude, :float)
      add(:longitude, :float)

      timestamps()
    end
  end
end
