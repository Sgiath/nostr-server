defmodule Nostr.Server do
  @moduledoc """
  Implementation of Nostr server
  """
  use Supervisor

  def start_link(opts) do
    Supervisor.start_link(__MODULE__, opts, name: __MODULE__)
  end

  @impl Supervisor
  def init(opts) do
    children = [
      {Bandit, plug: Nostr.Server.Plug, scheme: :http, options: [port: 4000]}
    ]

    Supervisor.init(children, Keyword.put_new(opts, :strategy, :one_for_one))
  end
end
