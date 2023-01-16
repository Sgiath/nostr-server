defmodule Nostr.Server.Plug do
  @moduledoc false

  def init(options) do
    options
  end

  def call(conn, _opts) do
    Plug.Conn.upgrade_adapter(conn, :websocket, {Nostr.Server.Handler, [], [compress: true]})
  end
end
