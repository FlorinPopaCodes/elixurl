defmodule Elixurl.Url do
  use Elixurl.Web, :model

  schema "urls" do
    field :path, :string

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:path])
    |> validate_required([:path])
  end
end
