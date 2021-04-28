defmodule CmsPullmanWeb.CompanyControllerTest do
  use CmsPullmanWeb.ConnCase

  alias CmsPullman.Account
  alias CmsPullman.Account.Company

  @create_attrs %{
    email: "some email",
    facebook: "some facebook",
    instagram: "some instagram",
    is_active: true,
    linkedin: "some linkedin",
    location: "some location",
    location_2: "some location_2",
    phone_number: "some phone_number",
    phone_number_2: "some phone_number_2"
  }
  @update_attrs %{
    email: "some updated email",
    facebook: "some updated facebook",
    instagram: "some updated instagram",
    is_active: false,
    linkedin: "some updated linkedin",
    location: "some updated location",
    location_2: "some updated location_2",
    phone_number: "some updated phone_number",
    phone_number_2: "some updated phone_number_2"
  }
  @invalid_attrs %{email: nil, facebook: nil, instagram: nil, is_active: nil, linkedin: nil, location: nil, location_2: nil, phone_number: nil, phone_number_2: nil}

  def fixture(:company) do
    {:ok, company} = Account.create_company(@create_attrs)
    company
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all companies", %{conn: conn} do
      conn = get(conn, Routes.company_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create company" do
    test "renders company when data is valid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.company_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some email",
               "facebook" => "some facebook",
               "instagram" => "some instagram",
               "is_active" => true,
               "linkedin" => "some linkedin",
               "location" => "some location",
               "location_2" => "some location_2",
               "phone_number" => "some phone_number",
               "phone_number_2" => "some phone_number_2"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.company_path(conn, :create), company: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update company" do
    setup [:create_company]

    test "renders company when data is valid", %{conn: conn, company: %Company{id: id} = company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.company_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some updated email",
               "facebook" => "some updated facebook",
               "instagram" => "some updated instagram",
               "is_active" => false,
               "linkedin" => "some updated linkedin",
               "location" => "some updated location",
               "location_2" => "some updated location_2",
               "phone_number" => "some updated phone_number",
               "phone_number_2" => "some updated phone_number_2"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, company: company} do
      conn = put(conn, Routes.company_path(conn, :update, company), company: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete company" do
    setup [:create_company]

    test "deletes chosen company", %{conn: conn, company: company} do
      conn = delete(conn, Routes.company_path(conn, :delete, company))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.company_path(conn, :show, company))
      end
    end
  end

  defp create_company(_) do
    company = fixture(:company)
    %{company: company}
  end
end
