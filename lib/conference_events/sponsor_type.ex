defmodule ConferenceEvents.SponsorType do
	use Ecto.Schema

	schema "sponsor_types" do
		field :name, :string
		field :cost, :decimal
		field :num_free_badges, :integer
		belongs_to :event, ConferenceEvents.Event
	end
end