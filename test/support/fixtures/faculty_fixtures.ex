defmodule ManyToMany.FacultyFixtures do
  @moduledoc """
  This module defines test helpers for creating
  entities via the `ManyToMany.Faculty` context.
  """

  @doc """
  Generate a professor.
  """
  def professor_fixture(attrs \\ %{}) do
    {:ok, professor} =
      attrs
      |> Enum.into(%{
        first_name: "some first_name",
        last_name: "some last_name",
        research_area: "some research_area"
      })
      |> ManyToMany.Faculty.create_professor()

    professor
  end
end
