# Clarke Coin Socket
The new rage for 2016 is those digital currencies, and the only one trading in the Turing School basement is Clarke Coin. Did you know that [Joan Clarke](https://en.wikipedia.org/wiki/Joan_Clarke) was a gifted numismatist and really into [gold unicorns](https://en.wikipedia.org/wiki/Unicorn_(coin))? Well now you know.

Bitcoin is built on the idea of distributed actors, but to deal with the lack of peers in a nascent system the first full node implementation was built as an [HTTP client](https://github.com/worace/clarke-coin). This application is an extension of Clarke Coin in order to bring other types of clients into the ecosystem. It is also ongoing as an exploration of the capabilities of the [Phoenix Framework.](http://www.phoenixframework.org/)

## Getting Started: Handshaking with Clarke Coin nodes
The current nodes connected to each other in a pseudo-peer-to-peer manner can be found from the [Clarke Coin DNS.](http://dns1.clarkecoin.org) The DNS does **NOT** push notifications of blocks and the current blockchain. It allows you to find peers to poll for this information, if you are not a full Clarke Coin node.

To connect to a node on the network and receive notifications, you must be able to receive and respond to certain requests. There is a handshake that occurs to connect to a given Clarke Coin full node. The steps are:

1. The server wanting to connect sends a request to the endpoint POST `/peers`, with a body containing a field port with a port number.
2. The Clarke Coin node will in turn attempt to send a POST request to the endpoint `/ping` to the host where the original post request came from at the port given in the body of the request. The node will expect to receive a JSON response with the body `{pong: <timestamp> }` where `timestamp` was provided in the request.
3. The Clarke Coin node will also send a GET request at the endpoint `/block_height` and expect to receive a response containing an integer corresponding to the server's blockchain height. This can be 0.

Once these steps have occurred, the Clarke Coin node will submit requests to the endpoint POST `/blocks` whenever a new block has been mined. NOTE: the nodes do **NOT** broadcast their connected peers to each other, so for full access to the network, a server will need to connect to all nodes listed on the DNS.

## Old stuff
To start your Phoenix app:

  * Install dependencies with `mix deps.get`
  * Create and migrate your database with `mix ecto.create && mix ecto.migrate`
  * Install Node.js dependencies with `npm install`
  * Start Phoenix endpoint with `mix phoenix.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser.

Ready to run in production? Please [check our deployment guides](http://www.phoenixframework.org/docs/deployment).

## Learn more

  * Official website: http://www.phoenixframework.org/
  * Guides: http://phoenixframework.org/docs/overview
  * Docs: http://hexdocs.pm/phoenix
  * Mailing list: http://groups.google.com/group/phoenix-talk
  * Source: https://github.com/phoenixframework/phoenix
