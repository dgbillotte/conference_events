defmodule ConferenceEvents.Event do
	use Ecto.Schema

	schema "events" do
		field :name, :string
		field :location, :integer
		field :date, :date
		field :cost, :decimal
		field :max_presentations, :integer
		field :presentation_length, :integer
		field :max_booths, :integer
		field :booth_cost, :decimal
		has_many :sponsor_types, ConferenceEvents.SponsorType
	end
end

defimpl Jason.Encoder, for: ConferenceEvents.Event do
  def encode(struct, opts) do
    %{
    	:id => struct.id,
    	:name => struct.name,
    	:location => struct.location,
    	:date => struct.date,
    	:cost => struct.cost,
		:max_presentations => struct.max_presentations,
		:presentation_length => struct.presentation_length,
		:max_booths => struct.max_booths,
		:booth_cost => struct.booth_cost
    } |> Jason.Encode.map(opts)
  end
end