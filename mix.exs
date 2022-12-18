defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      deps: deps(),
      elixir: "~> 1.14",
      escript: escript_config(),
      name: "Issues",
      source_url: "https://github.com/fabioueno/issues",
      start_permanent: Mix.env() == :prod,
      version: "0.1.0",
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:earmark, "~> 1.4.34"},
      {:ex_doc, "~> 0.29.1"},
      {:httpoison, "~> 1.8"},
      {:poison, "~> 5.0"}
    ]
  end

  defp escript_config do
    [
      main_module: Issues.CLI
    ]
  end
end
