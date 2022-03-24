defmodule ManyToManyWeb.ProfessorControllerTest do
  use ManyToManyWeb.ConnCase

  import ManyToMany.FacultyFixtures

  @create_attrs %{first_name: "some first_name", last_name: "some last_name", research_area: "some research_area"}
  @update_attrs %{first_name: "some updated first_name", last_name: "some updated last_name", research_area: "some updated research_area"}
  @invalid_attrs %{first_name: nil, last_name: nil, research_area: nil}

  describe "index" do
    test "lists all professors", %{conn: conn} do
      conn = get(conn, Routes.professor_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Professors"
    end
  end

  describe "new professor" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.professor_path(conn, :new))
      assert html_response(conn, 200) =~ "New Professor"
    end
  end

  describe "create professor" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.professor_path(conn, :create), professor: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.professor_path(conn, :show, id)

      conn = get(conn, Routes.professor_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Professor"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.professor_path(conn, :create), professor: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Professor"
    end
  end

  describe "edit professor" do
    setup [:create_professor]

    test "renders form for editing chosen professor", %{conn: conn, professor: professor} do
      conn = get(conn, Routes.professor_path(conn, :edit, professor))
      assert html_response(conn, 200) =~ "Edit Professor"
    end
  end

  describe "update professor" do
    setup [:create_professor]

    test "redirects when data is valid", %{conn: conn, professor: professor} do
      conn = put(conn, Routes.professor_path(conn, :update, professor), professor: @update_attrs)
      assert redirected_to(conn) == Routes.professor_path(conn, :show, professor)

      conn = get(conn, Routes.professor_path(conn, :show, professor))
      assert html_response(conn, 200) =~ "some updated first_name"
    end

    test "renders errors when data is invalid", %{conn: conn, professor: professor} do
      conn = put(conn, Routes.professor_path(conn, :update, professor), professor: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Professor"
    end
  end

  describe "delete professor" do
    setup [:create_professor]

    test "deletes chosen professor", %{conn: conn, professor: professor} do
      conn = delete(conn, Routes.professor_path(conn, :delete, professor))
      assert redirected_to(conn) == Routes.professor_path(conn, :index)

      assert_error_sent 404, fn ->
        get(conn, Routes.professor_path(conn, :show, professor))
      end
    end
  end

  defp create_professor(_) do
    professor = professor_fixture()
    %{professor: professor}
  end
end
