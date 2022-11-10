defmodule FoodTruckBuddy.FoodTrucks do
  @moduledoc """
  Context module for FoodTrucks
  """

  import Ecto.Query

  alias FoodTruckBuddy.{Repo, FoodTruck, CsvParser}

  @spec create_food_truck(map) :: {:ok, FoodTruck.t()} | {:error, %Ecto.Changeset{}}
  def create_food_truck(attrs) do
    %FoodTruck{}
    |> FoodTruck.changeset(attrs)
    |> Repo.insert()
  end

  @spec create_food_truck_from_csv(map) :: {:ok, FoodTruck.t()} | {:error, %Ecto.Changeset{}}
  def create_food_truck_from_csv(row) do
    row
    |> CsvParser.map_columns_from_csv_row()
    |> create_food_truck()
  end

  @spec get_food_truck(integer()) :: FoodTruckBuddy.t() | nil
  def get_food_truck(id), do: Repo.get(FoodTruck, id)

  @spec get_all_food_trucks() :: list
  def get_all_food_trucks(), do: Repo.all(FoodTruck)

  @spec get_food_trucks_by_zip_code(String.t()) :: list
  def get_food_trucks_by_zip_code(zip_code) do
    query = from(f in FoodTruck, where: f.status == "APPROVED", where: f.zip_code == ^zip_code)

    Repo.all(query)
  end

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
