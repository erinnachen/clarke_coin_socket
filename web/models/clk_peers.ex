defmodule ClarkeCoinSocket.ClkPeers do
  def fetch_peers do
    case HTTPoison.get("http://dns1.clarkecoin.org/api/peers") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end
