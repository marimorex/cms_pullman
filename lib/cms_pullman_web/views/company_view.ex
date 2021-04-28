defmodule CmsPullmanWeb.CompanyView do
  use CmsPullmanWeb, :view
  alias CmsPullmanWeb.CompanyView

  def render("index.json", %{companies: companies}) do
    %{companies: render_many(companies, CompanyView, "company.json")}
  end

  def render("show.json", %{company: company}) do
    %{company: render_one(company, CompanyView, "company.json")}
  end

  def render("company.json", %{company: company}) do
    %{
      company_id: company.company_id,
      location: company.location,
      location_2: company.location_2,
      phone_number: company.phone_number,
      phone_number_2: company.phone_number_2,
      email: company.email,
      linkedin: company.linkedin,
      instagram: company.instagram,
      facebook: company.facebook,
      is_active: company.is_active
    }
  end
end
