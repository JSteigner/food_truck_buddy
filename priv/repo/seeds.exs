# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     FoodTruckBuddy.Repo.insert!(%FoodTruckBuddy.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

FoodTruckBuddy.CsvParser.import_csv("Mobile_Food_Facility_Permit.csv")
