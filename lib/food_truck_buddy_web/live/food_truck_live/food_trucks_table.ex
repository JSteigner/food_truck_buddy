defmodule FoodTruckBuddyWeb.FoodTruckTable do
  @moduledoc """
  A stateless live view table component.
  Assigns that it needs are: a list of headers and a list of food trucks.
  """

  use FoodTruckBuddyWeb, :component

  def food_trucks_table(assigns) do
    ~H"""
    <section class="container">
      <h2>Food Trucks</h2>
      <table>
        <thead>
          <tr>
            <%= for header <- @headers do %>
              <th><%= header %></th>
            <% end %>
          </tr>
        </thead>
        <tbody>
          <%= for food_truck <- @food_trucks do %>
            <tr>
              <td><%= food_truck.name %></td>
              <td><%= food_truck.address %></td>
              <td><%= food_truck.food_items %></td>
            </tr>
          <% end %>
        </tbody>
      </table>
    </section>
    """
  end
end
