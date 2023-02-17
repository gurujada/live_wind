defmodule LiveWind.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      # Start the Telemetry supervisor
      LiveWindWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: LiveWind.PubSub},
      # Start Finch
      {Finch, name: LiveWind.Finch},
      # Start the Endpoint (http/https)
      LiveWindWeb.Endpoint
      # Start a worker by calling: LiveWind.Worker.start_link(arg)
      # {LiveWind.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: LiveWind.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    LiveWindWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
