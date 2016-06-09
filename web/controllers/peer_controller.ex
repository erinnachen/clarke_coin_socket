defmodule ClarkeCoinSocket.PeerController do
  use ClarkeCoinSocket.Web, :controller

  def ping(conn, params) do
    render conn, "ping.json", %{ping: params["ping"]}
  end
end
