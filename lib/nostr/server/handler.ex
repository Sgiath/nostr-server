defmodule Nostr.Server.Handler do
  @moduledoc false

  @behaviour WebSock

  require Logger

  @impl WebSock
  def init(_opts) do
    {:ok, []}
  end

  @impl WebSock
  def handle_in({_msg, opcode: :binary}, state) do
    Logger.error("Nostr doesn't talk binary")
    {:stop, :no_binary, state}
  end

  def handle_in({msg, opcode: :text}, state) do
    parsed = Nostr.Message.parse(msg)
    Logger.info("Received message: #{inspect(parsed)}")
    {:ok, state}
  end

  @impl WebSock
  def handle_info(_msg, state) do
    {:ok, state}
  end

  @impl WebSock
  def terminate(_reason, _state) do
    :ok
  end
end
