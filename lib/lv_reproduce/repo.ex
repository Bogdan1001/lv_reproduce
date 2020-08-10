defmodule LvReproduce.Repo do
  use Ecto.Repo,
    otp_app: :lv_reproduce,
    adapter: Ecto.Adapters.Postgres
end
