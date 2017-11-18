defmodule Annotatex.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags) do
      add :name, :string, null: false
      add :taggings_count, :integer, default: 0

      timestamps()
    end

    create unique_index(:tags, [:name])
  end
end
