defmodule ManyToMany.Repo.Migrations.CreateClasses do
  use Ecto.Migration

  def change do
    create table(:classes) do
      add :name, :string
      add :location, :string

      timestamps()
    end
  end
end
