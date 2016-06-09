defmodule ClarkeCoinSocket.PageController do
  use ClarkeCoinSocket.Web, :controller

  def index(conn, _params) do
    ClarkeCoinSocket.ClkPeers.ping_peers
    render conn, "index.html"
  end
end
