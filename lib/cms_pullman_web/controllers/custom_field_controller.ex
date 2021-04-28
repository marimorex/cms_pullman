defmodule CmsPullmanWeb.CustomFieldController do
  use CmsPullmanWeb, :controller

  alias CmsPullman.Account
  alias CmsPullman.Account.CustomField

  action_fallback CmsPullmanWeb.FallbackController

  def index(conn, %{"company_id" => company_id}) do
    custom_fields = Account.list_custom_fields_by_company_id(company_id)
    render(conn, "index.json", custom_fields: custom_fields)
  end

  def create(conn, %{"company_id" => company_id, "custom_field" => custom_field_params}) do
    company_custom_fields_params =  Map.merge(%{"company_id" => company_id }, custom_field_params)

    with {:ok, %CustomField{} = custom_field} <- Account.create_custom_field(company_custom_fields_params) do
      conn
      |> put_status(:created)
      |> put_resp_header("location", Routes.company_custom_field_path(conn, :create, custom_field))
      |> render("show.json", custom_field: custom_field)
    end
  end

  def show(conn, %{"company_id" => _company_id, "id" => id}) do
    custom_field = Account.get_custom_field!(id)
    render(conn, "show.json", custom_field: custom_field)
  end

  def update(conn, %{"company_id" => _company_id, "id" => id, "custom_field" => custom_field_params}) do
    custom_field = Account.get_custom_field!(id)

    with {:ok, %CustomField{} = custom_field} <- Account.update_custom_field(custom_field, custom_field_params) do
      render(conn, "show.json", custom_field: custom_field)
    end
  end

  def delete(conn, %{"company_id" => _company_id, "id" => id}) do
    custom_field = Account.get_custom_field!(id)

    with {:ok, %CustomField{}} <- Account.delete_custom_field(custom_field) do
      send_resp(conn, :no_content, "")
    end
  end
end
