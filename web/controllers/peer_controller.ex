defmodule ClarkeCoinSocket.PeerController do
  use ClarkeCoinSocket.Web, :controller

  def ping(conn, params) do
    json conn, %{pong: params["ping"]}
  end

  def block_height(conn, _params) do
    json conn, %{message: "block_height", payload: 0}
  end
end
