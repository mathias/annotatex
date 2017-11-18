defmodule Annotatex.Repo.Migrations.CreateTaggings do
  use Ecto.Migration

  def change do
    create table(:taggings) do
      add :tag_id, references(:tags, on_delete: :delete_all)
      add :post_id, references(:posts, on_delete: :delete_all)

    end
    create index(:taggings, [:tag_id])
    create index(:taggings, [:post_id])
    create unique_index(:taggings, [:tag_id, :post_id])
  end
end
