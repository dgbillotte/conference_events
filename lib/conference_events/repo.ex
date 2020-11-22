defmodule ConferenceEvents.Repo do
  use Ecto.Repo,
    otp_app: :conference_events,
    adapter: Ecto.Adapters.Postgres
end
