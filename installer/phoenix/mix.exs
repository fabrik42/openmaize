defmodule Openmaize.Phx.Mixfile do
  use Mix.Project

  def project do
    [app: :openmaize_phx,
     version: "2.8.0",
     elixir: "~> 1.3"]
  end

  # Configuration for the OTP application
  #
  # Type `mix help compile.app` for more information
  def application do
    [applications: []]
  end
end
