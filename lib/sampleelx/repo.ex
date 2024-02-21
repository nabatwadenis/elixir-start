defmodule Sampleelx.Repo do
  use Ecto.Repo,
    otp_app: :sampleelx,
    adapter: Ecto.Adapters.Postgres
end
