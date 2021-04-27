defmodule CmsPullman.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    children = [
      # Start the Ecto repository
      CmsPullman.Repo,
      # Start the Telemetry supervisor
      CmsPullmanWeb.Telemetry,
      # Start the PubSub system
      {Phoenix.PubSub, name: CmsPullman.PubSub},
      # Start the Endpoint (http/https)
      CmsPullmanWeb.Endpoint
      # Start a worker by calling: CmsPullman.Worker.start_link(arg)
      # {CmsPullman.Worker, arg}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: CmsPullman.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  def config_change(changed, _new, removed) do
    CmsPullmanWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
