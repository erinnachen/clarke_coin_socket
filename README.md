# Clarke Coin Socket
The new rage for 2016 is those digital currencies, and the only one trading in the Turing School basement is Clarke Coin. Did you know that [Joan Clarke](https://en.wikipedia.org/wiki/Joan_Clarke) was a gifted numismatist and really into [gold unicorns](https://en.wikipedia.org/wiki/Unicorn_(coin))? Well now you know.

Bitcoin is built on the idea of distributed actors, but to deal with the lack of peers in a nascent system the first full node implementation was built as an [HTTP client](https://github.com/worace/clarke-coin). This application is an extension of Clarke Coin in order to bring other types of clients into the ecosystem. It is also ongoing as an exploration of the capabilities of the [Phoenix Framework.](http://www.phoenixframework.org/)

## Getting Started: Handshaking with Clarke Coin nodes
Currently the full nodes are connected to each other in a pseudo-peer-to-peer manner. These nodes can be found from the [Clarke Coin DNS.](http://dns1.clarkecoin.org) The DNS does **NOT** push notifications of blocks and the current blockchain. It allows you to find peers to poll for this information, if you are not a full Clarke Coin node.

To connect to a node on the network and receive notifications, you must be able to receive and respond to certain requests. There is a handshake that occurs to connect to a given Clarke Coin full node. The steps are:

1. The server wanting to connect sends a request to the endpoint POST `/peers`, with a body containing a field port with a port number.
2. The Clarke Coin node will in turn attempt to send a POST request to the endpoint `/ping` to the host where the original post request came from at the port given in the body of the request. The node will expect to receive a JSON response with the body `{pong: <timestamp> }` where `timestamp` was provided in the request.
3. The Clarke Coin node will also send a GET request at the endpoint `/block_height` and expect to receive a response containing an integer corresponding to the server's blockchain height. This can be 0.

Once these steps have occurred, the Clarke Coin node will submit requests to the endpoint POST `/blocks` whenever a new block has been mined. NOTE: the nodes do **NOT** broadcast their connected peers to each other, so for full access to the network, a server will need to connect to all nodes listed on the DNS.

## Installation
This app is built using Phoenix, which is dependent on Elixir and Erlang. You'll want to have Elixir installed first and the [docs](http://elixir-lang.org/install.html) are a super good way to begin. The Elixir installation process will also install Erlang on your machine. The [Phoenix docs](http://www.phoenixframework.org/docs/installation) are super clear on the installation process of Phoenix.

Disclaimer: before you begin, the handshake process requires access through an external IP address and port. If you are used to deploying your apps on [Heroku](https://www.heroku.com/), the normal hobby/dev plans will not allow the handshake to occur.

### Development environment
If you want to test this out, you can connect to a locally running [Clarke Coin full node](https://github.com/worace/clarke-coin). Currently the code hard codes peer connections in `model/clk_peers.ex`, but this can easily be modifed to point to `localhost` and the appropriate port that the full node is running on.

### Production on Digital Ocean
Currently a version of this application is running [here](http://107.170.205.129:4000/). Check out that sweet default template! You can send requests to this deployed app corresponding to the handshake steps noted above:
- POST '/ping'
- GET '/block_height'
