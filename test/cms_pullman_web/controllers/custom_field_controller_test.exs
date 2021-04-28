defmodule CmsPullmanWeb.CustomFieldControllerTest do
  use CmsPullmanWeb.ConnCase

  alias CmsPullman.Account
  alias CmsPullman.Account.CustomField

  @create_attrs %{
    description: "some description",
    is_active: true,
    link: "some link",
    logo: "some logo",
    name: "some name"
  }
  @update_attrs %{
    description: "some updated description",
    is_active: false,
    link: "some updated link",
    logo: "some updated logo",
    name: "some updated name"
  }
  @invalid_attrs %{description: nil, is_active: nil, link: nil, logo: nil, name: nil}

  def fixture(:custom_field) do
    {:ok, custom_field} = Account.create_custom_field(@create_attrs)
    custom_field
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all custom_fields", %{conn: conn} do
      conn = get(conn, Routes.custom_field_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create custom_field" do
    test "renders custom_field when data is valid", %{conn: conn} do
      conn = post(conn, Routes.custom_field_path(conn, :create), custom_field: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.custom_field_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some description",
               "is_active" => true,
               "link" => "some link",
               "logo" => "some logo",
               "name" => "some name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.custom_field_path(conn, :create), custom_field: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update custom_field" do
    setup [:create_custom_field]

    test "renders custom_field when data is valid", %{conn: conn, custom_field: %CustomField{id: id} = custom_field} do
      conn = put(conn, Routes.custom_field_path(conn, :update, custom_field), custom_field: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.custom_field_path(conn, :show, id))

      assert %{
               "id" => id,
               "description" => "some updated description",
               "is_active" => false,
               "link" => "some updated link",
               "logo" => "some updated logo",
               "name" => "some updated name"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, custom_field: custom_field} do
      conn = put(conn, Routes.custom_field_path(conn, :update, custom_field), custom_field: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete custom_field" do
    setup [:create_custom_field]

    test "deletes chosen custom_field", %{conn: conn, custom_field: custom_field} do
      conn = delete(conn, Routes.custom_field_path(conn, :delete, custom_field))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.custom_field_path(conn, :show, custom_field))
      end
    end
  end

  defp create_custom_field(_) do
    custom_field = fixture(:custom_field)
    %{custom_field: custom_field}
  end
end
