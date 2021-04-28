defmodule CmsPullman.Repo.Migrations.CreateCustomFields do
  use Ecto.Migration

  def change do
    create table(:custom_fields, primary_key: false) do
      add :custom_field_id, :serial, primary_key: true
      add :company_id, references(:companies, on_delete: :delete_all, column: :company_id)
      add :name, :string
      add :description, :string
      add :logo, :string
      add :link, :string
      add :is_active, :boolean, default: false, null: false

      timestamps()
    end

  end
end
