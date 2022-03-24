defmodule ManyToMany.Faculty.Professor do
  use Ecto.Schema
  import Ecto.Changeset

  schema "professors" do
    field :first_name, :string
    field :last_name, :string
    field :research_area, :string

    timestamps()
  end

  @doc false
  def changeset(professor, attrs) do
    professor
    |> cast(attrs, [:last_name, :first_name, :research_area])
    |> validate_required([:last_name, :first_name, :research_area])
  end
end
