defmodule ManyToManyWeb.ProfessorController do
  use ManyToManyWeb, :controller

  alias ManyToMany.Faculty
  alias ManyToMany.Faculty.Professor

  def index(conn, _params) do
    professors = Faculty.list_professors()
    render(conn, "index.html", professors: professors)
  end

  def new(conn, _params) do
    changeset = Faculty.change_professor(%Professor{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"professor" => professor_params}) do
    case Faculty.create_professor(professor_params) do
      {:ok, professor} ->
        conn
        |> put_flash(:info, "Professor created successfully.")
        |> redirect(to: Routes.professor_path(conn, :show, professor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    professor = Faculty.get_professor!(id)
    render(conn, "show.html", professor: professor)
  end

  def edit(conn, %{"id" => id}) do
    professor = Faculty.get_professor!(id)
    changeset = Faculty.change_professor(professor)
    render(conn, "edit.html", professor: professor, changeset: changeset)
  end

  def update(conn, %{"id" => id, "professor" => professor_params}) do
    professor = Faculty.get_professor!(id)

    case Faculty.update_professor(professor, professor_params) do
      {:ok, professor} ->
        conn
        |> put_flash(:info, "Professor updated successfully.")
        |> redirect(to: Routes.professor_path(conn, :show, professor))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", professor: professor, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    professor = Faculty.get_professor!(id)
    {:ok, _professor} = Faculty.delete_professor(professor)

    conn
    |> put_flash(:info, "Professor deleted successfully.")
    |> redirect(to: Routes.professor_path(conn, :index))
  end
end
