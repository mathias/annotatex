defmodule Annotatex.Repo.Migrations.AddUserIdToPosts do
  use Ecto.Migration

  def change do
    alter table(:posts) do
      add :user_id, references(:users, type: :binary_id), null: false
    end
  end
end
