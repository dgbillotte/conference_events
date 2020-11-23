defmodule ConferenceEvents.Repo.Migrations.CreateSponsorTypes do
  use Ecto.Migration

  def change do
  	create table(:sponsor_types) do
  		add :name, :string
  		add :cost, :decimal
  		add :num_free_badges, :integer
  		# add :event_id, :integer
  		add :event_id, references(:events)
  	end
  end
end
