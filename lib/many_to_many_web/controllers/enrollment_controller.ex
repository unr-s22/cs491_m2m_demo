defmodule ManyToManyWeb.EnrollmentController do
  use ManyToManyWeb, :controller

  alias ManyToMany.Academics
  alias ManyToMany.Academics.Enrollment

  def index(conn, _params) do
    enrollments = Academics.list_enrollments()
    render(conn, "index.html", enrollments: enrollments)
  end

  def new(conn, _params) do
    changeset = Academics.change_enrollment(%Enrollment{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"enrollment" => enrollment_params}) do
    case Academics.create_enrollment(enrollment_params) do
      {:ok, enrollment} ->
        conn
        |> put_flash(:info, "Enrollment created successfully.")
        |> redirect(to: Routes.enrollment_path(conn, :show, enrollment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    enrollment = Academics.get_enrollment!(id)
    render(conn, "show.html", enrollment: enrollment)
  end

  def edit(conn, %{"id" => id}) do
    enrollment = Academics.get_enrollment!(id)
    changeset = Academics.change_enrollment(enrollment)
    render(conn, "edit.html", enrollment: enrollment, changeset: changeset)
  end

  def update(conn, %{"id" => id, "enrollment" => enrollment_params}) do
    enrollment = Academics.get_enrollment!(id)

    case Academics.update_enrollment(enrollment, enrollment_params) do
      {:ok, enrollment} ->
        conn
        |> put_flash(:info, "Enrollment updated successfully.")
        |> redirect(to: Routes.enrollment_path(conn, :show, enrollment))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", enrollment: enrollment, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    enrollment = Academics.get_enrollment!(id)
    {:ok, _enrollment} = Academics.delete_enrollment(enrollment)

    conn
    |> put_flash(:info, "Enrollment deleted successfully.")
    |> redirect(to: Routes.enrollment_path(conn, :index))
  end
end
