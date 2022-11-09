defmodule FoodTruckBuddy.FoodTrucksTest do
  use FoodTruckBuddy.DataCase, async: true

  alias FoodTruckBuddy.{FoodTruck, FoodTrucks}

  @create_attrs %{
    name: "Bomb Tacos",
    address: "200 Main Street",
    zip_code: "70117",
    status: "APPROVED",
    food_items: "Tacos: Burritos: Quesadillas: Tortas: Nachos: Hot Dogs:Soda: Water: Fruit Drinks"
  }

  setup do
    {:ok, food_truck} = FoodTrucks.create_food_truck(@create_attrs)

    {:ok, food_truck: food_truck}
  end

  describe "creating a Food Truck" do
    test "create_food_truck\1 creates a food truck when passed valid attrs" do
      {:ok, %FoodTruck{} = food_truck} = FoodTrucks.create_food_truck(@create_attrs)
      food_truck_from_db = FoodTrucks.get_food_truck(food_truck.id)

      assert food_truck.id == food_truck_from_db.id
    end

    test "create_food_truck\1 doesn't create a food truck when passed invalid attrs", %{
      food_truck: already_created_food_truck
    } do
      {:error, %Ecto.Changeset{}} = FoodTrucks.create_food_truck(%{name: nil})

      assert FoodTrucks.get_all_food_trucks() == [already_created_food_truck]
    end
  end

  describe "Retrieving a Food Truck" do
    test "get_food_truck\1 gets a food truck when passed exisiting id", %{
      food_truck: food_truck
    } do
      %FoodTruck{} = food_truck_from_db = FoodTrucks.get_food_truck(food_truck.id)

      assert food_truck_from_db.id == food_truck.id
    end

    test "get_food_truck\1 doesn't get a food truck when passed a non-exisiting id" do
      assert FoodTrucks.get_food_truck(200) == nil
    end

    test "get_all_food_trucks\0 gets all food trucks" do
      food_trucks = FoodTrucks.get_all_food_trucks()

      assert length(food_trucks) == 1
    end
  end

  describe "updating a Food Truck" do
    test "update_food_truck\2 updates a food truck when passed valid attrs", %{
      food_truck: food_truck
    } do
      assert food_truck.name == "Bomb Tacos"

      {:ok, %FoodTruck{} = updated_food_truck} =
        FoodTrucks.update_food_truck(food_truck, %{name: "Wicked Sick Tacos"})

      assert updated_food_truck.name == "Wicked Sick Tacos"
    end

    test "update_food_truck\2 doesn't update a food truck when passed invalid attrs", %{
      food_truck: food_truck
    } do
      assert food_truck.name == "Bomb Tacos"

      {:error, %Ecto.Changeset{}} = FoodTrucks.update_food_truck(food_truck, %{name: nil})

      assert food_truck.name == "Bomb Tacos"
    end
  end

  describe "deleting a Food Truck" do
    test "delete_food_truck\1 deletes a food truck", %{
      food_truck: food_truck
    } do
      {:ok, %FoodTruck{} = deleted_food_truck} = FoodTrucks.delete_food_truck(food_truck)

      assert FoodTrucks.get_food_truck(deleted_food_truck.id) == nil
    end
  end
end
