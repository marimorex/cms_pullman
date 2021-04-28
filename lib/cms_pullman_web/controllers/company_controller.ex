defmodule CmsPullmanWeb.CompanyController do
  use CmsPullmanWeb, :controller

  alias CmsPullman.Account
  alias CmsPullman.Account.Company

  action_fallback CmsPullmanWeb.FallbackController

  def index(conn, _params) do
    companies = Account.list_companies()
    render(conn, "index.json", companies: companies)
  end

  def create(conn, %{"company" => company_params}) do
    with {:ok, %Company{} = company} <- Account.create_company(company_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.company_path(conn, :show, company))
      |> render("show.json", company: company)
    end
  end

  def show(conn, %{"id" => id}) do
    company = Account.get_company!(id)
    render(conn, "show.json", company: company)
  end

  def update(conn, %{"id" => id, "company" => company_params}) do
    company = Account.get_company!(id)

    with {:ok, %Company{} = company} <- Account.update_company(company, company_params) do
      render(conn, "show.json", company: company)
    end
  end

  def delete(conn, %{"id" => id}) do
    company = Account.get_company!(id)

    with {:ok, %Company{}} <- Account.delete_company(company) do
      send_resp(conn, :no_content, "")
    end
  end
end
