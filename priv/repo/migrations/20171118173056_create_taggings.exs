defmodule Annotatex.Repo.Migrations.CreateTaggings do
  use Ecto.Migration

  def change do
    create table(:taggings, primary_key: false) do
      add :id, :binary_id, primary_key: true
      add :tag_id, references(:tags, on_delete: :delete_all, type: :binary_id), null: false
      add :post_id, references(:posts, on_delete: :delete_all, type: :binary_id), null: false
    end

    create index(:taggings, [:tag_id])
    create index(:taggings, [:post_id])
    create unique_index(:taggings, [:tag_id, :post_id])
  end
end
