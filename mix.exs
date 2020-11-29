defmodule Astro.MixProject do
  use Mix.Project

  @version "0.1.0"
  @repo "https://github.com/aledsz/astro-live-view"

  def project do
    [
      app: :astro,
      version: @version,
      elixir: "~> 1.8",
      compilers: [:phoenix] ++ Mix.compilers(),
      start_permanent: Mix.env() == :prod,
      elixirc_paths: elixirc_paths(Mix.env()),
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test
      ],
      package: package(),
      docs: docs(),
      deps: deps()
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  def application do
    [extra_applications: [:logger, :runtime_tools]]
  end

  defp docs do
    [
      main: "Astro",
      source_ref: "v#{@version}",
      source_url: @repo,
      extras: ["README.md"]
    ]
  end

  defp package do
    [
      links: %{github: @repo}
    ]
  end

  defp deps do
    [
      {:phoenix_live_view, "~> 0.15.0", optional: true},
      {:surface, "~> 0.1.1", optional: true},
      {:credo, "~> 1.5.0", only: [:dev, :test], runtime: false},
      {:ex_doc, "~> 0.21", only: :dev, runtime: false},
      {:floki, "~> 0.29.0", only: :test},
      {:excoveralls, "~> 0.10", only: :test},
      {:mix_test_watch, "~> 1.0", only: :test, runtime: false}
    ]
  end
end
