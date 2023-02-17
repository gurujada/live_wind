defmodule LiveWind.MixProject do
  use Mix.Project

  @source_url "https://github.com/gurujada/live_wind"
  @version "0.0.1"

  def project do
    [
      app: :live_wind,
      version: @version,
      elixir: "~> 1.14",
      elixirc_paths: elixirc_paths(Mix.env()),
      start_permanent: Mix.env() == :prod,
      description: description(),
      package: package(),
      deps: deps(),
      docs: docs(),
      aliases: [
        audit: ["format"]
      ]
    ]
  end

  # Configuration for the OTP application.
  #
  # Type `mix help compile.app` for more information.
  def application do
    [
      extra_applications: [:logger, :runtime_tools]
    ]
  end

  # Specifies which paths to compile per environment.
  defp elixirc_paths(:test), do: ["lib", "test/support"]
  defp elixirc_paths(_), do: ["lib"]

  # Specifies your project dependencies.
  #
  # Type `mix help deps` for examples and options.
  defp deps do
    [
      {:phoenix, "~> 1.7.0-rc.3", override: true},
      {:phoenix_html, "~> 3.3"},
      {:phoenix_live_view, "~> 0.18.14"},
      {:heroicons, "~> 0.5"},
      {:floki, ">= 0.30.0", only: :test},
      {:phoenix_live_dashboard, "~> 0.7.2"},
      {:gettext, "~> 0.20"},
      {:jason, "~> 1.2", only: [:dev, :test]},
      {:ex_doc, "~> 0.24", only: :dev, runtime: false},
      {:phoenix_ecto, "~> 4.4"},
      {:credo, "~> 1.6", only: [:dev, :test], runtime: false},
      {:excoveralls, "~> 0.10", only: :test}
    ]
  end

  defp description() do
    """
    LiveWind is a set of HEEX components built using tailwindcss that makes it easy for Phoenix developers to build beautiful web apps.
    """
  end

  defp package do
    [
      maintainers: ["Krishnamohan Chivukula"],
      licenses: ["MIT"],
      links: %{"GitHub" => @source_url},
      files: ~w(mix.exs priv lib assets README.md LICENSE.md CHANGELOG.md)
    ]
  end

  defp docs() do
    [
      main: "readme",
      logo: "logo.png",
      name: "LiveWind",
      source_ref: "v#{@version}",
      canonical: "http://hexdocs.pm/live_wind",
      source_url: @source_url,
      extras: ["README.md"]
    ]
  end

  # Aliases are shortcuts or tasks specific to the current project.
  # For example, to install project dependencies and perform other setup tasks, run:
  #
  #     $ mix setup
  #
  # See the documentation for `Mix` for more info on aliases.
end
