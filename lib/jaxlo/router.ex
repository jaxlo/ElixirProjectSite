defmodule Jaxlo.Router do
  use Plug.Router

  plug :match
  plug :dispatch

  get "/" do
    send_resp(conn, 200, "Welcome to the Jaxlo.net rebuild")
  end

  get "/project/:project" do # View a project
    send_resp(conn, 200, "Ok #{project}")
  end

  get "project/:project/:filename" do # Project files
    send_resp(conn, 200, "Ok #{project} #{filename}")
  end

  match _ do # All other paths
    send_resp(conn, 404, "Nothing found")
  end
end
