defmodule Elixurl.Repo.Migrations.CreateUrl do
  use Ecto.Migration

  def change do
    create table(:urls) do
      add :path, :string

      timestamps()
    end

  end
end
