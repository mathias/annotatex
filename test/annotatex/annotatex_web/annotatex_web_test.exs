defmodule Annotatex.AnnotatexWebTest do
  use Annotatex.DataCase

  alias Annotatex.AnnotatexWeb

  describe "links" do
    alias Annotatex.AnnotatexWeb.Link

    @valid_attrs %{commentary: "some commentary", external_url: "some external_url", tags: "some tags", title: "some title"}
    @update_attrs %{commentary: "some updated commentary", external_url: "some updated external_url", tags: "some updated tags", title: "some updated title"}
    @invalid_attrs %{commentary: nil, external_url: nil, tags: nil, title: nil}

    def link_fixture(attrs \\ %{}) do
      {:ok, link} =
        attrs
        |> Enum.into(@valid_attrs)
        |> AnnotatexWeb.create_link()

      link
    end

    test "list_links/0 returns all links" do
      link = link_fixture()
      assert AnnotatexWeb.list_links() == [link]
    end

    test "get_link!/1 returns the link with given id" do
      link = link_fixture()
      assert AnnotatexWeb.get_link!(link.id) == link
    end

    test "create_link/1 with valid data creates a link" do
      assert {:ok, %Link{} = link} = AnnotatexWeb.create_link(@valid_attrs)
      assert link.commentary == "some commentary"
      assert link.external_url == "some external_url"
      assert link.tags == "some tags"
      assert link.title == "some title"
    end

    test "create_link/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = AnnotatexWeb.create_link(@invalid_attrs)
    end

    test "update_link/2 with valid data updates the link" do
      link = link_fixture()
      assert {:ok, link} = AnnotatexWeb.update_link(link, @update_attrs)
      assert %Link{} = link
      assert link.commentary == "some updated commentary"
      assert link.external_url == "some updated external_url"
      assert link.tags == "some updated tags"
      assert link.title == "some updated title"
    end

    test "update_link/2 with invalid data returns error changeset" do
      link = link_fixture()
      assert {:error, %Ecto.Changeset{}} = AnnotatexWeb.update_link(link, @invalid_attrs)
      assert link == AnnotatexWeb.get_link!(link.id)
    end

    test "delete_link/1 deletes the link" do
      link = link_fixture()
      assert {:ok, %Link{}} = AnnotatexWeb.delete_link(link)
      assert_raise Ecto.NoResultsError, fn -> AnnotatexWeb.get_link!(link.id) end
    end

    test "change_link/1 returns a link changeset" do
      link = link_fixture()
      assert %Ecto.Changeset{} = AnnotatexWeb.change_link(link)
    end
  end
end
