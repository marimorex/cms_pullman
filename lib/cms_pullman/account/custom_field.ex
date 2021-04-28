defmodule CmsPullman.Account.CustomField do
  use Ecto.Schema
  import Ecto.Changeset
  import Ecto.Query, warn: false

  @derive {Phoenix.Param, key: :custom_field_id}
	@primary_key {:custom_field_id, :id, autogenerate: true}

  schema "custom_fields" do
    field :description, :string
    field :is_active, :boolean, default: true
    field :link, :string
    field :logo, :string
    field :name, :string

    timestamps()
    belongs_to :company, CmsPullman.Account.Company, foreign_key: :company_id, references: :company_id
  end

  def changeset(custom_field, attrs) do
    custom_field
    |> cast(attrs, [:name, :description, :logo, :link, :is_active, :company_id])
    |> validate_required([:name, :description, :logo, :link, :is_active])
  end

  def get_by_company_id(company_id) do
    from cf in __MODULE__, where: cf.company_id == ^company_id
  end
end
