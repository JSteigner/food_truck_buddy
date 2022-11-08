defmodule FoodTruckBuddy.Repo do
  use Ecto.Repo,
    otp_app: :food_truck_buddy,
    adapter: Ecto.Adapters.Postgres
end
