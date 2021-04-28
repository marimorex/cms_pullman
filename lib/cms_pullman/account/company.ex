defmodule CmsPullman.Account.Company do
  use Ecto.Schema
  import Ecto.Changeset

  @derive {Phoenix.Param, key: :company_id}
  @primary_key {:company_id, :id, autogenerate: true}

  schema "companies" do
    field :email, :string
    field :facebook, :string
    field :instagram, :string
    field :is_active, :boolean, default: true
    field :linkedin, :string
    field :location, :string
    field :location_2, :string
    field :phone_number, :string
    field :phone_number_2, :string

    timestamps()
    has_many :custom_fields, CmsPullman.Account.CustomField, foreign_key: :company_id, references: :company_id
  end

  @doc false
  def changeset(company, attrs) do
    company
    |> cast(attrs, [:location, :location_2, :phone_number, :phone_number_2, :email, :linkedin, :instagram, :facebook, :is_active])
    |> validate_required([:location, :location_2, :phone_number, :phone_number_2, :email, :linkedin, :instagram, :facebook, :is_active])
  end
end
