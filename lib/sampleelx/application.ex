defmodule Sampleelx.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      SampleelxWeb.Telemetry,
      Sampleelx.Repo,
      {DNSCluster, query: Application.get_env(:sampleelx, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Sampleelx.PubSub},
      # Start the Finch HTTP client for sending emails
      {Finch, name: Sampleelx.Finch},
      # Start a worker by calling: Sampleelx.Worker.start_link(arg)
      # {Sampleelx.Worker, arg},
      # Start to serve requests, typically the last entry
      SampleelxWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Sampleelx.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    SampleelxWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
