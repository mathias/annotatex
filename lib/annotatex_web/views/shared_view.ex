defmodule AnnotatexWeb.SharedView do
  use AnnotatexWeb, :view

  def display_date(post) do
    Timex.format!(post.inserted_at, "%B %-e, %Y", :strftime)
  end
end
