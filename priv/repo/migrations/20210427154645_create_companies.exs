defmodule CmsPullman.Repo.Migrations.CreateCompanies do
  use Ecto.Migration

  def change do
    create table(:companies, primary_key: false) do
      add :company_id, :serial, primary_key: true
      add :location, :string
      add :location_2, :string
      add :phone_number, :string
      add :phone_number_2, :string
      add :email, :string
      add :linkedin, :string
      add :instagram, :string
      add :facebook, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
