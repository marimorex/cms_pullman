defmodule CmsPullman.Account.User do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :user_id}
	@primary_key {:user_id, :id, autogenerate: true}

  schema "users" do
    field :email, :string
    field :image_url, :string
    field :lastname, :string
    field :name, :string
    field :password_hash, :string
    field :phone_number, :string
    field :rut, :string

    timestamps()
    belongs_to :company, CmsPullman.Account.Company, foreign_key: :company_id, references: :company_id
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :lastname, :email, :password_hash, :rut, :image_url, :phone_number, :company_id])
    |> validate_required([:name, :lastname, :email, :password_hash, :rut, :image_url, :phone_number, :company_id])
  end
end
