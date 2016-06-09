defmodule ClarkeCoinSocket.PeerView do
  use ClarkeCoinSocket.Web, :view

  def render("ping.json", %{ping: timestamp}) do
    %{pong: String.to_integer timestamp}
  end
end
