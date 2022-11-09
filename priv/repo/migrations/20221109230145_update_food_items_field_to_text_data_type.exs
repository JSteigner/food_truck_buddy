defmodule FoodTruckBuddy.Repo.Migrations.UpdateFoodItemsFieldToTextDataType do
  use Ecto.Migration

  def up do
    alter table(:food_trucks) do
      modify :food_items, :text
    end
  end

  def down do
    alter table(:food_trucks) do
      modify :food_items, :string
    end
  end
end
