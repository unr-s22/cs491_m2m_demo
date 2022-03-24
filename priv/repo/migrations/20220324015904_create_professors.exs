defmodule ManyToMany.Repo.Migrations.CreateProfessors do
  use Ecto.Migration

  def change do
    create table(:professors) do
      add :last_name, :string
      add :first_name, :string
      add :research_area, :string

      timestamps()
    end
  end
end
