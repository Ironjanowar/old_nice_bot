defmodule NiceBot do
  use Application

  require Logger

  import Supervisor.Spec

  def start(_type, _args) do
    token = Telex.Config.get(:nice_bot, :token)

    children = [
      supervisor(Telex, []),
      supervisor(NiceBot.Bot, [:polling, token])
    ]

    opts = [strategy: :one_for_one, name: NiceBot]

    case Supervisor.start_link(children, opts) do
      {:ok, _} = ok ->
        Logger.info("Starting NiceBot")
        ok

      error ->
        Logger.error("Error starting NiceBot")
        error
    end
  end
end
