defmodule FoodTruckBuddyWeb.FoodTruckLive.Index do
  @moduledoc """
  Food Trucks Live View
  """

  use FoodTruckBuddyWeb, :live_view
  import Ecto.Changeset

  alias FoodTruckBuddy.FoodTrucks
  import FoodTruckBuddyWeb.FoodTruckTable

  @headers ["Name", "Address", "Menu"]

  def mount(_params, _session, socket),
    do:
      {:ok,
       assign(socket, headers: @headers, food_trucks: nil, changeset: zip_code_changeset(%{}))}

  def handle_event("change", %{"changeset" => %{"zip_code" => zip_code}}, socket),
    do: {:noreply, assign(socket, :zip_code, zip_code)}

  def handle_event("clear", _params, socket), do: {:noreply, assign(socket, :food_trucks, nil)}

  def handle_event("submit", _params, %{assigns: %{zip_code: zip_code}} = socket) do
    case FoodTrucks.get_food_trucks_by_zip_code(zip_code) do
      [] ->
        {:noreply, put_flash(socket, :error, "There are no Food Trucks in that area")}

      food_trucks ->
        {:noreply, assign(socket, :food_trucks, food_trucks)}
    end
  end

  defp zip_code_changeset(attrs) do
    types = %{zip_code: :string}

    {%{}, types}
    |> cast(attrs, Map.keys(types))
    |> validate_required(:zip_code)
    |> validate_length(:zip_code, min: 5, max: 5)
  end
end
