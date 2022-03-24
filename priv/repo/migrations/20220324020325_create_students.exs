defmodule ManyToMany.Repo.Migrations.CreateStudents do
  use Ecto.Migration

  def change do
    create table(:students) do
      add :last_name, :string
      add :first_name, :string
      add :unr_sid, :integer

      timestamps()
    end
  end
end
