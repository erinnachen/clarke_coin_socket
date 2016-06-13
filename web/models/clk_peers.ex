defmodule ClarkeCoinSocket.ClkPeers do
  def fetch_peers do
    case HTTPoison.get!("http://dns1.clarkecoin.org/api/peers") do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end

  def ping_peers do
    opts = "{\"port\": 4000 }"
    IO.puts "OPTS: #{opts}"
    case HTTPoison.post("http://159.203.206.61:3000/peers" , opts, [{"Content-Type", "application/json"},{"Accept", "application/json"}], [{:recv_timeout, 15000}]) do
      {:ok, %HTTPoison.Response{status_code: 200, body: body}} ->
        IO.puts body
      {:ok, %HTTPoison.Response{status_code: 404}} ->
        IO.puts "Not found :("
      {:error, %HTTPoison.Error{reason: reason}} ->
        IO.inspect reason
    end
  end
end

# Fetch peers
# Handle the response
#
