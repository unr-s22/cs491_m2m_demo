defmodule ManyToMany.Academics.Class do
  use Ecto.Schema
  import Ecto.Changeset
  alias ManyToMany.Academics.{Enrollment, Student}

  schema "classes" do
    field :location, :string
    field :name, :string
    has_many(:enrollments, Enrollment)
    # has_many(:students, through: [:enrollments, :student])
    many_to_many(:students, Student, join_through: Enrollment)
    timestamps()
  end

  @doc false
  def changeset(class, attrs) do
    class
    |> cast(attrs, [:name, :location])
    |> validate_required([:name, :location])
  end
end
