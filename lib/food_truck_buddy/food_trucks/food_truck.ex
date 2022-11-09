defmodule FoodTruckBuddy.FoodTruck do
  @moduledoc """
  The schema for a FoodTruck
  """

  @type t :: %__MODULE__{}

  use Ecto.Schema
  import Ecto.Changeset

  schema("food_trucks") do
    field(:name, :string)
    field(:type, :string)
    field(:location_area, :string)
    field(:address, :string)
    field(:zip_code, :string)
    field(:status, :string)
    field(:food_items, :string)
    field(:latitude, :float)
    field(:longitude, :float)

    timestamps()
  end

  def changeset(%__MODULE__{} = food_truck, attrs) do
    food_truck
    |> cast(attrs, [
      :name,
      :type,
      :location_area,
      :address,
      :zip_code,
      :status,
      :food_items,
      :latitude,
      :longitude
    ])
    |> validate_required([:name, :address, :zip_code, :status, :food_items])
  end
end
