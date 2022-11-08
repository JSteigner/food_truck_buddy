defmodule FoodTruckBuddyWeb.PageController do
  use FoodTruckBuddyWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
