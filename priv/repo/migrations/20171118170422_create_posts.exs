defmodule Annotatex.Repo.Migrations.CreatePosts do
  use Ecto.Migration

  def change do
    create table(:posts) do
      add :title, :string, null: false
      add :slug, :string, null: false
      add :body, :text, null: false
      add :external_url, :string

      add :user_id, references(:users, on_delete: :delete_all)

      timestamps()
    end

    create unique_index(:posts, [:slug])
    create index(:posts, [:user_id])
  end
end
