defmodule Issues.MixProject do
  use Mix.Project

  def project do
    [
      app: :issues,
      deps: deps(),
      elixir: "~> 1.14",
      escript: escript_config(),
      name: "Issues",
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      source_url: "https://github.com/fabioueno/issues",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      version: "0.1.0"
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
      {:credo, "~> 1.6.7", only: [:dev, :test], runtime: false},
      {:earmark, "~> 1.4.34"},
      {:ex_doc, "~> 0.29.1", only: :dev, runtime: false},
      {:excoveralls, "~> 0.15.2", only: :test},
      {:httpoison, "~> 1.8.2"},
      {:poison, "~> 5.0.0"}
    ]
  end

  defp escript_config do
    [
      main_module: Issues.CLI
    ]
  end
end
