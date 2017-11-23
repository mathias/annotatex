# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Annotatex.Repo.insert!(%Annotatex.SomeSchema{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

alias Annotatex.Repo
alias Annotatex.Accounts
alias Annotatex.Accounts.User
alias Annotatex.Posts

user_email = "matt.gauger@gmail.com"
user = Accounts.get_user_by_email!(user_email)

unless user do
  attrs = %{name: "Matt Gauger", email: user_email}
  %User{}
  |> User.changeset(attrs)
  |> Repo.insert!()
  user = Accounts.get_user_by_email!(user_email)
end

links = [
  %{title: "gram-ai/radio-transformer-networks", body: "This could prove very interesting. DARPA issued <a href=\"https://spectrumcollaborationchallenge.com/\">a Grand Challenge</a> to use machine learning with software-defined radio a few years ago.", external_url: "https://github.com/gram-ai/radio-transformer-networks", user_id: user.id, published_at: Timex.to_datetime({{2017, 11, 12}, {17, 46, 0}}, "America/Chicago") }
]
Enum.map(links, fn l -> Posts.create_post!(l) end)
