defmodule ManyToMany.AcademicsTest do
  use ManyToMany.DataCase

  alias ManyToMany.Academics

  describe "classes" do
    alias ManyToMany.Academics.Class

    import ManyToMany.AcademicsFixtures

    @invalid_attrs %{location: nil, name: nil}

    test "list_classes/0 returns all classes" do
      class = class_fixture()
      assert Academics.list_classes() == [class]
    end

    test "get_class!/1 returns the class with given id" do
      class = class_fixture()
      assert Academics.get_class!(class.id) == class
    end

    test "create_class/1 with valid data creates a class" do
      valid_attrs = %{location: "some location", name: "some name"}

      assert {:ok, %Class{} = class} = Academics.create_class(valid_attrs)
      assert class.location == "some location"
      assert class.name == "some name"
    end

    test "create_class/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Academics.create_class(@invalid_attrs)
    end

    test "update_class/2 with valid data updates the class" do
      class = class_fixture()
      update_attrs = %{location: "some updated location", name: "some updated name"}

      assert {:ok, %Class{} = class} = Academics.update_class(class, update_attrs)
      assert class.location == "some updated location"
      assert class.name == "some updated name"
    end

    test "update_class/2 with invalid data returns error changeset" do
      class = class_fixture()
      assert {:error, %Ecto.Changeset{}} = Academics.update_class(class, @invalid_attrs)
      assert class == Academics.get_class!(class.id)
    end

    test "delete_class/1 deletes the class" do
      class = class_fixture()
      assert {:ok, %Class{}} = Academics.delete_class(class)
      assert_raise Ecto.NoResultsError, fn -> Academics.get_class!(class.id) end
    end

    test "change_class/1 returns a class changeset" do
      class = class_fixture()
      assert %Ecto.Changeset{} = Academics.change_class(class)
    end
  end

  describe "students" do
    alias ManyToMany.Academics.Student

    import ManyToMany.AcademicsFixtures

    @invalid_attrs %{first_name: nil, last_name: nil, unr_sid: nil}

    test "list_students/0 returns all students" do
      student = student_fixture()
      assert Academics.list_students() == [student]
    end

    test "get_student!/1 returns the student with given id" do
      student = student_fixture()
      assert Academics.get_student!(student.id) == student
    end

    test "create_student/1 with valid data creates a student" do
      valid_attrs = %{first_name: "some first_name", last_name: "some last_name", unr_sid: 42}

      assert {:ok, %Student{} = student} = Academics.create_student(valid_attrs)
      assert student.first_name == "some first_name"
      assert student.last_name == "some last_name"
      assert student.unr_sid == 42
    end

    test "create_student/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Academics.create_student(@invalid_attrs)
    end

    test "update_student/2 with valid data updates the student" do
      student = student_fixture()
      update_attrs = %{first_name: "some updated first_name", last_name: "some updated last_name", unr_sid: 43}

      assert {:ok, %Student{} = student} = Academics.update_student(student, update_attrs)
      assert student.first_name == "some updated first_name"
      assert student.last_name == "some updated last_name"
      assert student.unr_sid == 43
    end

    test "update_student/2 with invalid data returns error changeset" do
      student = student_fixture()
      assert {:error, %Ecto.Changeset{}} = Academics.update_student(student, @invalid_attrs)
      assert student == Academics.get_student!(student.id)
    end

    test "delete_student/1 deletes the student" do
      student = student_fixture()
      assert {:ok, %Student{}} = Academics.delete_student(student)
      assert_raise Ecto.NoResultsError, fn -> Academics.get_student!(student.id) end
    end

    test "change_student/1 returns a student changeset" do
      student = student_fixture()
      assert %Ecto.Changeset{} = Academics.change_student(student)
    end
  end

  describe "enrollments" do
    alias ManyToMany.Academics.Enrollment

    import ManyToMany.AcademicsFixtures

    @invalid_attrs %{}

    test "list_enrollments/0 returns all enrollments" do
      enrollment = enrollment_fixture()
      assert Academics.list_enrollments() == [enrollment]
    end

    test "get_enrollment!/1 returns the enrollment with given id" do
      enrollment = enrollment_fixture()
      assert Academics.get_enrollment!(enrollment.id) == enrollment
    end

    test "create_enrollment/1 with valid data creates a enrollment" do
      valid_attrs = %{}

      assert {:ok, %Enrollment{} = enrollment} = Academics.create_enrollment(valid_attrs)
    end

    test "create_enrollment/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Academics.create_enrollment(@invalid_attrs)
    end

    test "update_enrollment/2 with valid data updates the enrollment" do
      enrollment = enrollment_fixture()
      update_attrs = %{}

      assert {:ok, %Enrollment{} = enrollment} = Academics.update_enrollment(enrollment, update_attrs)
    end

    test "update_enrollment/2 with invalid data returns error changeset" do
      enrollment = enrollment_fixture()
      assert {:error, %Ecto.Changeset{}} = Academics.update_enrollment(enrollment, @invalid_attrs)
      assert enrollment == Academics.get_enrollment!(enrollment.id)
    end

    test "delete_enrollment/1 deletes the enrollment" do
      enrollment = enrollment_fixture()
      assert {:ok, %Enrollment{}} = Academics.delete_enrollment(enrollment)
      assert_raise Ecto.NoResultsError, fn -> Academics.get_enrollment!(enrollment.id) end
    end

    test "change_enrollment/1 returns a enrollment changeset" do
      enrollment = enrollment_fixture()
      assert %Ecto.Changeset{} = Academics.change_enrollment(enrollment)
    end
  end
end
