defmodule Jaxlo.Static do
  use Plug.Builder

  plug Plug.Static,
    at: "static",
    from: :jaxlo,
    only: ~w(images robots.txt)
  plug :not_found

  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]},
      type: :worker,
      restart: :permanent,
      shutdown: 500
    }
  end


  def not_found(conn, _) do
    send_resp(conn, 404, "not found")
  end
end
