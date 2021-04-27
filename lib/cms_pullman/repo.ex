defmodule CmsPullman.Repo do
  use Ecto.Repo,
    otp_app: :cms_pullman,
    adapter: Ecto.Adapters.Postgres
end
