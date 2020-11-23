defmodule ConferenceEventsWeb.EventController do
  use ConferenceEventsWeb, :controller

  alias ConferenceEvents.{Repo, Event}

  def index(conn, _params) do
    json(conn, Repo.all(Event) |> Repo.preload(:sponsor_types))
  end

  def show(conn, %{"id" => id}) do
    json(conn, Repo.get(Event, id) |> Repo.preload(:sponsor_types))
  end

  def create(conn, params) do
    # TODO: validation
    # - location must be valid
    # - max_booths must be <= location.booths

    event = %Event{
      name: params["name"],
      location: params["location"],
      date: Date.from_iso8601!(params["date"]),
      cost: params["cost"],
      max_presentations: params["max_presentations"],
      presentation_length: params["presentation_length"],
      max_booths: params["max_booths"],
      booth_cost: params["booth_cost"]
    }

    event = Repo.insert!(event)

    Enum.each(params["sponsor_types"], fn s ->
      Repo.insert!(Ecto.build_assoc(event, :sponsor_types,
        %{
          name: s["name"],
          cost: s["cost"],
          num_free_badges: s["free_badges"]
        }))
    end)

    IO.inspect event

    # send_queue_msg("event.create", Jason.encode!(event))

    json(conn, event)
  end

  def udpate(conn, params) do
    event = Repo.get(Event, params["id"])

    changes = %{
      date: params["date"],
      location: params["location"],
      cost: params["cost"]
    }

    # changeset = Event.changeset(event, changes)

    # Repo.update(changeset)
  end

  defp send_queue_msg(queue, msg) do
    {:ok, connection} = AMQP.Connection.open
    {:ok, channel} = AMQP.Channel.open(connection)
    AMQP.Queue.declare(channel, queue)
    AMQP.Basic.publish(channel, "", queue, msg)
    AMQP.Connection.close(connection)    
  end

  defp get_location(id) do
    case id do
      x when rem(x, 2) == 0 ->
        %{
          name: "Location #" <> id,
          seats: 100*id,
          booths: 10*id
        }
      _ ->
        nil
    end
  end

end