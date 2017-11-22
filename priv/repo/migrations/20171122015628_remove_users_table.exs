defmodule Annotatex.Repo.Migrations.RemoveUsersTable do
  use Ecto.Migration

  def change do
    alter table("posts") do
      remove :user_id
    end

    drop table(:users)
  end
end
