defmodule ConferenceEvents.Event do
	use Ecto.Schema

	schema "events" do
		field :location, :string
		field :date, :date
		field :cost, :decimal
	end
end