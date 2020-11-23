defmodule ConferenceEvents.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
  	create table(:events) do
  		# location date, cost, num-attendees, presentations, sponsor-types, vendor-types
      add :name, :string      
  		add :location, :integer
  		add :date, :date
  		add :cost, :decimal
      add :max_presentations, :integer
      add :presentation_length, :integer
      add :max_booths, :integer
      add :booth_cost, :decimal
  	end
  end
end
