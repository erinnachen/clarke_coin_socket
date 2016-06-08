ExUnit.start

Mix.Task.run "ecto.create", ~w(-r ClarkeCoinSocket.Repo --quiet)
Mix.Task.run "ecto.migrate", ~w(-r ClarkeCoinSocket.Repo --quiet)
Ecto.Adapters.SQL.begin_test_transaction(ClarkeCoinSocket.Repo)

