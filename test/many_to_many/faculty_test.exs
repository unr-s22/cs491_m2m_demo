defmodule ManyToMany.FacultyTest do
  use ManyToMany.DataCase

  alias ManyToMany.Faculty

  describe "professors" do
    alias ManyToMany.Faculty.Professor

    import ManyToMany.FacultyFixtures

    @invalid_attrs %{first_name: nil, last_name: nil, research_area: nil}

    test "list_professors/0 returns all professors" do
      professor = professor_fixture()
      assert Faculty.list_professors() == [professor]
    end

    test "get_professor!/1 returns the professor with given id" do
      professor = professor_fixture()
      assert Faculty.get_professor!(professor.id) == professor
    end

    test "create_professor/1 with valid data creates a professor" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name", research_area: "some research_area"}

      assert {:ok, %Professor{} = professor} = Faculty.create_professor(valid_attrs)
      assert professor.first_name == "some first_name"
      assert professor.last_name == "some last_name"
      assert professor.research_area == "some research_area"
    end

    test "create_professor/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Faculty.create_professor(@invalid_attrs)
    end

    test "update_professor/2 with valid data updates the professor" do
      professor = professor_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name", research_area: "some updated research_area"}

      assert {:ok, %Professor{} = professor} = Faculty.update_professor(professor, update_attrs)
      assert professor.first_name == "some updated first_name"
      assert professor.last_name == "some updated last_name"
      assert professor.research_area == "some updated research_area"
    end

    test "update_professor/2 with invalid data returns error changeset" do
      professor = professor_fixture()
      assert {:error, %Ecto.Changeset{}} = Faculty.update_professor(professor, @invalid_attrs)
      assert professor == Faculty.get_professor!(professor.id)
    end

    test "delete_professor/1 deletes the professor" do
      professor = professor_fixture()
      assert {:ok, %Professor{}} = Faculty.delete_professor(professor)
      assert_raise Ecto.NoResultsError, fn -> Faculty.get_professor!(professor.id) end
    end

    test "change_professor/1 returns a professor changeset" do
      professor = professor_fixture()
      assert %Ecto.Changeset{} = Faculty.change_professor(professor)
    end
  end
end
