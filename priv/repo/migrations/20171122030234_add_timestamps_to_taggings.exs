defmodule Annotatex.Repo.Migrations.AddTimestampsToTaggings do
  use Ecto.Migration

  def change do
    alter table(:taggings) do
      timestamps()
    end
  end
end
