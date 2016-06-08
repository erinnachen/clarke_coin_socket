defmodule ClarkeCoinSocket.PageController do
  use ClarkeCoinSocket.Web, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
