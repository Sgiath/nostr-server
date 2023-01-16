defmodule Nostr.Server.MixProject do
  use Mix.Project

  @version "0.0.1"

  def project do
    [
      # Library
      app: :nostr_server,
      version: @version,

      # Elixir
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      consolidate_protocols: Mix.env() != :test,
      deps: deps(),

      # Documentation
      name: "Nostr Server",
      source_url: "https://github.com/Sgiath/nostr-server",
      homepage_url: "https://nostr.sgiath.dev",
      description: description(),
      package: package(),
      docs: docs()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp deps do
    [
      {:nostr_lib, ">= 0.0.0"},

      # Documentation
      {:ex_doc, "~> 0.29", only: :dev, runtime: false}
    ]
  end

  # Documentation

  defp description do
    "Library which implements Nostr server"
  end

  defp package do
    [
      name: "nostr_server",
      maintainers: ["Sgiath <nostr@sgiath.dev>"],
      files: ~w(lib .formatter.exs mix.exs README* LICENSE* CHANGELOG*),
      licenses: ["WTFPL"],
      links: %{
        "GitHub" => "https://github.com/Sgiath/nostr-server",
        "Nostr specs" => "https://github.com/nostr-protocol/nips"
      }
    ]
  end

  defp docs do
    [
      authors: [
        "Sgiath <nostr@sgiath.dev>"
      ],
      main: "overview",
      formatters: ["html"],
      extras: ["README.md"]
    ]
  end
end
