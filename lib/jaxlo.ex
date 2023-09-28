defmodule Jaxlo.Application do
  # This is the main file that manages the workers/plugs
  require Logger
  use Application


  @impl true
  def start(_type, _args) do
    children = [
      # Starts a worker by calling: Jaxlo.Worker.start_link(arg)
      # {Jaxlo.Worker, arg}
      #{Plug.Cowboy, scheme: :http, plug: Jaxlo.HelloWorldPlug, options: [port: 7000]},
      {Plug.Cowboy, scheme: :http, plug: Jaxlo.Router, options: [port: 8000]},
      #{Plug.Static, plug: Jaxlo.Static, from: {Jaxlo, "static"}}
    ]

    Logger.info("Running the webserver")

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Jaxlo.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
