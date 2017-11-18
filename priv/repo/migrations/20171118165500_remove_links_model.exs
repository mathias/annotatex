defmodule Annotatex.Repo.Migrations.RemoveLinksModel do
  use Ecto.Migration

  def change do
    drop table(:links)
  end
end
