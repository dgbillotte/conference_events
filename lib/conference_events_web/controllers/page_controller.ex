defmodule ConferenceEventsWeb.PageController do
  use ConferenceEventsWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def foobar(conn, _params) do

	{:ok, connection} = AMQP.Connection.open
	{:ok, channel} = AMQP.Channel.open(connection)
	AMQP.Queue.declare(channel, "helloz")
	AMQP.Basic.publish(channel, "", "helloz", "Helloz Worldz!")
	IO.puts " [x] Sent 'Helloz Worldz!'"
	AMQP.Connection.close(connection)


  	text(conn, "f00b4R")
  end	

  def event_create(conn, _params) do
  	# e = ConferenceEvents.Event{
  	# 	date: ~D[2021-02-11],
  	# 	location: "some place",
  	# 	cost: 15
  	# }
  end
end
