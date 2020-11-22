defmodule ConferenceEvents.Repo.Migrations.CreateEvents do
  use Ecto.Migration

  def change do
  	create table(:events) do
  		# location date, cost, num-attendees, presentations, sponsor-types, vendor-types
  		add :location, :string 
  		add :date, :date
  		add :cost, :decimal
  	end
  end
end
