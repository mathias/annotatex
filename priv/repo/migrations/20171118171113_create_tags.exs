defmodule Annotatex.Repo.Migrations.CreateTags do
  use Ecto.Migration

  def change do
    create table(:tags, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :name, :string, null: false
      add :taggings_count, :integer, default: 0

      timestamps()
    end

    create unique_index(:tags, [:name])
  end
end
