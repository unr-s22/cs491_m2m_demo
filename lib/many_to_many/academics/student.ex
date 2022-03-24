defmodule ManyToMany.Academics.Student do
  use Ecto.Schema
  import Ecto.Changeset
  alias ManyToMany.Academics.{Enrollment, Class}
  alias ManyToMany.Faculty.Professor

  schema "students" do
    field :first_name, :string
    field :last_name, :string
    field :unr_sid, :integer
    has_many(:enrollments, Enrollment)
    many_to_many(:classes, Class, join_through: Enrollment)
    many_to_many(:professors, Professor, join_through: Enrollment)
    timestamps()
  end

  @doc false
  def changeset(student, attrs) do
    student
    |> cast(attrs, [:last_name, :first_name, :unr_sid])
    |> validate_required([:last_name, :first_name, :unr_sid])
  end
end
