defmodule LvReproduce.Schema do
  use Ecto.Schema
  import Ecto.Changeset
  alias LvReproduce.Schema

  @fields [
    :title,
    :codemirror
  ]

  schema("schema") do
    field :title, :string
    field :codemirror, :string
  end

  def changeset(params, a \\ %Schema{}) do
    a
    |> cast(params, @fields)
  end
end
