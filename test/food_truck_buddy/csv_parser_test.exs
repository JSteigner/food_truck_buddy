defmodule FoodTruckBuddy.CsvParserTest do
  use FoodTruckBuddy.DataCase, async: true

  alias FoodTruckBuddy.{CsvParser, FoodTruck}

  test "importing a csv creates Food Trucks" do
    assert [{:ok, %FoodTruck{}} | _] = CsvParser.import_csv("Mobile_Food_Facility_Permit.csv")
  end
end
