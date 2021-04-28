defmodule CmsPullmanWeb.CustomFieldView do
  use CmsPullmanWeb, :view
  alias CmsPullmanWeb.CustomFieldView

  def render("index.json", %{custom_fields: custom_fields}) do
    %{custom_fields: render_many(custom_fields, CustomFieldView, "custom_field.json")}
  end

  def render("show.json", %{custom_field: custom_field}) do
    %{custom_field: render_one(custom_field, CustomFieldView, "custom_field.json")}
  end

  def render("custom_field.json", %{custom_field: custom_field}) do
    %{
      custom_field_id: custom_field.custom_field_id,
      company_id: custom_field.company_id,
      name: custom_field.name,
      description: custom_field.description,
      logo: custom_field.logo,
      link: custom_field.link,
      is_active: custom_field.is_active
    }
  end
end
