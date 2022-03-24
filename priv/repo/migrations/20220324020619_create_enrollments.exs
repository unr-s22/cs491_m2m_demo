defmodule ManyToMany.Repo.Migrations.CreateEnrollments do
  use Ecto.Migration

  def change do
    create table(:enrollments) do
      add :class_id, references(:classes, on_delete: :nothing)
      add :student_id, references(:students, on_delete: :nothing)
      add :professor_id, references(:professors, on_delete: :nothing)

      timestamps()
    end

    create index(:enrollments, [:class_id])
    create index(:enrollments, [:student_id])
    create index(:enrollments, [:professor_id])
  end
end
