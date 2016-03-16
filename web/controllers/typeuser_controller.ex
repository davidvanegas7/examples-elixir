defmodule HelloPhoenix.TypeuserController do
  use HelloPhoenix.Web, :controller

  alias HelloPhoenix.Typeuser

  plug :scrub_params, "typeuser" when action in [:create, :update]

  def index(conn, _params) do
    type_user = Repo.all(Typeuser)
    render(conn, "index.html", type_user: type_user)
  end

  def new(conn, _params) do
    changeset = Typeuser.changeset(%Typeuser{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"typeuser" => typeuser_params}) do
    changeset = Typeuser.changeset(%Typeuser{}, typeuser_params)

    case Repo.insert(changeset) do
      {:ok, _typeuser} ->
        conn
        |> put_flash(:info, "Typeuser created successfully.")
        |> redirect(to: typeuser_path(conn, :index))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    typeuser = Repo.get!(Typeuser, id)
    render(conn, "show.html", typeuser: typeuser)
  end

  def edit(conn, %{"id" => id}) do
    typeuser = Repo.get!(Typeuser, id)
    changeset = Typeuser.changeset(typeuser)
    render(conn, "edit.html", typeuser: typeuser, changeset: changeset)
  end

  def update(conn, %{"id" => id, "typeuser" => typeuser_params}) do
    typeuser = Repo.get!(Typeuser, id)
    changeset = Typeuser.changeset(typeuser, typeuser_params)

    case Repo.update(changeset) do
      {:ok, typeuser} ->
        conn
        |> put_flash(:info, "Typeuser updated successfully.")
        |> redirect(to: typeuser_path(conn, :show, typeuser))
      {:error, changeset} ->
        render(conn, "edit.html", typeuser: typeuser, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    typeuser = Repo.get!(Typeuser, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(typeuser)

    conn
    |> put_flash(:info, "Typeuser deleted successfully.")
    |> redirect(to: typeuser_path(conn, :index))
  end
end
