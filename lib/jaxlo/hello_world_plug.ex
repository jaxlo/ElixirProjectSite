defmodule Jaxlo.HelloWorldPlug do
  import Plug.Conn

  def init(options), do: options

  def call(conn, _opts) do
    conn
    |> put_resp_content_type("text/plain")
    |> send_resp(200, "Hello Elixir")

    # Is the fancy Elixir way of saying:
    # send_resp(put_resp_content_type(conn, "text/plain"), 200, "Hello Elixir")
  end
end
