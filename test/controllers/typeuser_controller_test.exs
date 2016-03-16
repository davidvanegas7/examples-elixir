defmodule HelloPhoenix.TypeuserControllerTest do
  use HelloPhoenix.ConnCase

  alias HelloPhoenix.Typeuser
  @valid_attrs %{description: "some content", name: "some content"}
  @invalid_attrs %{}

  test "lists all entries on index", %{conn: conn} do
    conn = get conn, typeuser_path(conn, :index)
    assert html_response(conn, 200) =~ "Listing type user"
  end

  test "renders form for new resources", %{conn: conn} do
    conn = get conn, typeuser_path(conn, :new)
    assert html_response(conn, 200) =~ "New typeuser"
  end

  test "creates resource and redirects when data is valid", %{conn: conn} do
    conn = post conn, typeuser_path(conn, :create), typeuser: @valid_attrs
    assert redirected_to(conn) == typeuser_path(conn, :index)
    assert Repo.get_by(Typeuser, @valid_attrs)
  end

  test "does not create resource and renders errors when data is invalid", %{conn: conn} do
    conn = post conn, typeuser_path(conn, :create), typeuser: @invalid_attrs
    assert html_response(conn, 200) =~ "New typeuser"
  end

  test "shows chosen resource", %{conn: conn} do
    typeuser = Repo.insert! %Typeuser{}
    conn = get conn, typeuser_path(conn, :show, typeuser)
    assert html_response(conn, 200) =~ "Show typeuser"
  end

  test "renders page not found when id is nonexistent", %{conn: conn} do
    assert_error_sent 404, fn ->
      get conn, typeuser_path(conn, :show, -1)
    end
  end

  test "renders form for editing chosen resource", %{conn: conn} do
    typeuser = Repo.insert! %Typeuser{}
    conn = get conn, typeuser_path(conn, :edit, typeuser)
    assert html_response(conn, 200) =~ "Edit typeuser"
  end

  test "updates chosen resource and redirects when data is valid", %{conn: conn} do
    typeuser = Repo.insert! %Typeuser{}
    conn = put conn, typeuser_path(conn, :update, typeuser), typeuser: @valid_attrs
    assert redirected_to(conn) == typeuser_path(conn, :show, typeuser)
    assert Repo.get_by(Typeuser, @valid_attrs)
  end

  test "does not update chosen resource and renders errors when data is invalid", %{conn: conn} do
    typeuser = Repo.insert! %Typeuser{}
    conn = put conn, typeuser_path(conn, :update, typeuser), typeuser: @invalid_attrs
    assert html_response(conn, 200) =~ "Edit typeuser"
  end

  test "deletes chosen resource", %{conn: conn} do
    typeuser = Repo.insert! %Typeuser{}
    conn = delete conn, typeuser_path(conn, :delete, typeuser)
    assert redirected_to(conn) == typeuser_path(conn, :index)
    refute Repo.get(Typeuser, typeuser.id)
  end
end
