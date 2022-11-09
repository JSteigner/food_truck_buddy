defmodule FoodTruckBuddy.FoodTrucks do
  @moduledoc """
  Context module for FoodTrucks
  """

  alias FoodTruckBuddy.{Repo, FoodTruck}

  @spec create_food_truck(map) :: {:ok, FoodTruck.t()} | {:error, %Ecto.Changeset{}}
  def create_food_truck(attrs) do
    %FoodTruck{}
    |> FoodTruck.changeset(attrs)
    |> Repo.insert()
  end

  @spec get_food_truck(integer()) :: FoodTruckBuddy.t() | nil
  def get_food_truck(id), do: Repo.get(FoodTruck, id)

  @spec get_all_food_trucks() :: list
  def get_all_food_trucks(), do: Repo.all(FoodTruck)

  @spec update_food_truck(FoodTruck.t(), map) ::
          {:ok, FoodTruck.t()} | {:error, %Ecto.Changeset{}}
  def update_food_truck(%FoodTruck{} = food_truck, attrs) do
    food_truck
    |> FoodTruck.changeset(attrs)
    |> Repo.update()
  end

  @spec delete_food_truck(FoodTruck.t()) :: {:ok, FoodTruck.t()} | {:error, %Ecto.Changeset{}}
  def delete_food_truck(%FoodTruck{} = food_truck), do: Repo.delete(food_truck)
end
