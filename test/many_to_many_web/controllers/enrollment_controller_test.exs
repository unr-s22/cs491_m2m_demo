defmodule ManyToManyWeb.EnrollmentControllerTest do
  use ManyToManyWeb.ConnCase

  import ManyToMany.AcademicsFixtures

  @create_attrs %{}
  @update_attrs %{}
  @invalid_attrs %{}

  describe "index" do
    test "lists all enrollments", %{conn: conn} do
      conn = get(conn, Routes.enrollment_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Enrollments"
    end
  end

  describe "new enrollment" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.enrollment_path(conn, :new))
      assert html_response(conn, 200) =~ "New Enrollment"
    end
  end

  describe "create enrollment" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.enrollment_path(conn, :create), enrollment: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.enrollment_path(conn, :show, id)

      conn = get(conn, Routes.enrollment_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Enrollment"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.enrollment_path(conn, :create), enrollment: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Enrollment"
    end
  end

  describe "edit enrollment" do
    setup [:create_enrollment]

    test "renders form for editing chosen enrollment", %{conn: conn, enrollment: enrollment} do
      conn = get(conn, Routes.enrollment_path(conn, :edit, enrollment))
      assert html_response(conn, 200) =~ "Edit Enrollment"
    end
  end

  describe "update enrollment" do
    setup [:create_enrollment]

    test "redirects when data is valid", %{conn: conn, enrollment: enrollment} do
      conn = put(conn, Routes.enrollment_path(conn, :update, enrollment), enrollment: @update_attrs)
      assert redirected_to(conn) == Routes.enrollment_path(conn, :show, enrollment)

      conn = get(conn, Routes.enrollment_path(conn, :show, enrollment))
      assert html_response(conn, 200)
    end

    test "renders errors when data is invalid", %{conn: conn, enrollment: enrollment} do
      conn = put(conn, Routes.enrollment_path(conn, :update, enrollment), enrollment: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Enrollment"
    end
  end

  describe "delete enrollment" do
    setup [:create_enrollment]

    test "deletes chosen enrollment", %{conn: conn, enrollment: enrollment} do
      conn = delete(conn, Routes.enrollment_path(conn, :delete, enrollment))
      assert redirected_to(conn) == Routes.enrollment_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.enrollment_path(conn, :show, enrollment))
      end
    end
  end

  defp create_enrollment(_) do
    enrollment = enrollment_fixture()
    %{enrollment: enrollment}
  end
end
