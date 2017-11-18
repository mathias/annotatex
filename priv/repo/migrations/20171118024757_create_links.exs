defmodule Annotatex.Repo.Migrations.CreateLinks do
  use Ecto.Migration

  def change do
    create table(:links) do
      add :title, :string
      add :external_url, :string
      add :commentary, :string
      add :tags, :string

      timestamps()
    end

  end
end
