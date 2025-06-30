defmodule MmoServer.PersistenceWorker do
  @moduledoc """
  Broadway pipeline persisting game state to Postgres.
  """
  use Broadway
  alias Broadway.Message

  def start_link(_opts) do
    Broadway.start_link(__MODULE__,
      name: __MODULE__,
      producer: [
        module: {BroadwayPostgres.Producer, []},
        concurrency: 1
      ],
      processors: [default: [concurrency: 1]]
    )
  end

  @impl true
  def handle_message(_, %Message{data: _data} = message, _) do
    # persist data using Repo
    message
  end
end
