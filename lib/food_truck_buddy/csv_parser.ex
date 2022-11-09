defmodule FoodTruckBuddy.CsvParser do
  @moduledoc """
  Module for creating Food Trucks from a csv file
  """

  alias FoodTruckBuddy.FoodTrucks

  @spec import_csv(String.t()) :: list
  def import_csv(file_path) do
    file_path
    |> File.stream!()
    |> CSV.decode!(headers: true, strip_fields: true)
    |> Enum.map(&FoodTrucks.create_food_truck_from_csv(&1))
  end

  @spec map_columns_from_csv_row(map) :: map
  def map_columns_from_csv_row(row) do
    %{
      name: String.trim(row["Applicant"]),
      type: String.trim(row["FacilityType"]),
      location_area: String.trim(row["LocationDescription"]),
      address: String.trim(row["Address"]),
      zip_code: String.trim(row["Zip Codes"]),
      status: String.trim(row["Status"]),
      food_items: String.trim(row["FoodItems"]),
      latitude: String.trim(row["Latitude"]),
      longitude: String.trim(row["Longitude"])
    }
  end
end
