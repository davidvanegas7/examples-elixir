defmodule HelloPhoenix.TypeuserTest do
  use HelloPhoenix.ModelCase

  alias HelloPhoenix.Typeuser

  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Typeuser.changeset(%Typeuser{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Typeuser.changeset(%Typeuser{}, @invalid_attrs)
    refute changeset.valid?
  end
end
