defmodule ManyToMany.Repo.Migrations.AddFeeToEnrollment do
  use Ecto.Migration

  def change do
    alter table("enrollments") do
      add :fee, :integer
    end
  end
end
