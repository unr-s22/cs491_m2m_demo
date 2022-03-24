defmodule ManyToMany.AcademicsFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ManyToMany.Academics` context.
  """

  @doc """
  Generate a class.
  """
  def class_fixture(attrs \\ %{}) do
    {:ok, class} =
      attrs
      |> Enum.into(%{
        location: "some location",
        name: "some name"
      })
      |> ManyToMany.Academics.create_class()

    class
  end

  @doc """
  Generate a student.
  """
  def student_fixture(attrs \\ %{}) do
    {:ok, student} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name",
        unr_sid: 42
      })
      |> ManyToMany.Academics.create_student()

    student
  end

  @doc """
  Generate a enrollment.
  """
  def enrollment_fixture(attrs \\ %{}) do
    {:ok, enrollment} =
      attrs
      |> Enum.into(%{

      })
      |> ManyToMany.Academics.create_enrollment()

    enrollment
  end
end
