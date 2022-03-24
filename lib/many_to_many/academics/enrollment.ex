defmodule ManyToMany.Academics.Enrollment do
  use Ecto.Schema
  import Ecto.Changeset
  alias ManyToMany.Academics.{Student, Class}
  alias ManyToMany.Faculty.Professor

  schema "enrollments" do
    belongs_to(:class, Class)
    belongs_to(:student, Student)
    belongs_to(:professor, Professor)
    field :fee, :integer

    timestamps()
  end

  @doc false
  def changeset(enrollment, attrs) do
    enrollment
    |> cast(attrs, [:class_id, :student_id, :professor_id, :fee])
    |> validate_required([:class_id, :student_id, :professor_id, :fee])
    # requires that the set for an enrollment is unique
    |> unique_constraint([:class_id, :student_id, :professor_id])
  end
end
