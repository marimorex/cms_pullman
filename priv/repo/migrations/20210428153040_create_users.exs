defmodule CmsPullman.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    create table(:users, primary_key: false) do
      add :user_id, :serial, primary_key: true
      add :company_id, references(:companies, on_delete: :delete_all, column: :company_id)
      add :name, :string
      add :lastname, :string
      add :email, :string
      add :password_hash, :string
      add :rut, :string
      add :image_url, :string
      add :rut, :string
      add :phone_number, :string

      timestamps()
    end

  end
end
