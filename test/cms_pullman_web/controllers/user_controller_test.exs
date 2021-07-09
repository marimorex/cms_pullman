defmodule CmsPullmanWeb.UserControllerTest do
  use CmsPullmanWeb.ConnCase

  alias CmsPullman.Account
  alias CmsPullman.Account.User

  @create_attrs %{
    email: "some email",
    image_url: "some image_url",
    lastname: "some lastname",
    name: "some name",
    password_hash: "some password_hash",
    phone_number: "some phone_number",
    rut: "some rut"
  }
  @update_attrs %{
    email: "some updated email",
    image_url: "some updated image_url",
    lastname: "some updated lastname",
    name: "some updated name",
    password_hash: "some updated password_hash",
    phone_number: "some updated phone_number",
    rut: "some updated rut"
  }
  @invalid_attrs %{email: nil, image_url: nil, lastname: nil, name: nil, password_hash: nil, phone_number: nil, rut: nil}

  def fixture(:user) do
    {:ok, user} = Account.create_user(@create_attrs)
    user
  end

  setup %{conn: conn} do
    {:ok, conn: put_req_header(conn, "accept", "application/json")}
  end

  describe "index" do
    test "lists all users", %{conn: conn} do
      conn = get(conn, Routes.user_path(conn, :index))
      assert json_response(conn, 200)["data"] == []
    end
  end

  describe "create user" do
    test "renders user when data is valid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @create_attrs)
      assert %{"id" => id} = json_response(conn, 201)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some email",
               "image_url" => "some image_url",
               "lastname" => "some lastname",
               "name" => "some name",
               "password_hash" => "some password_hash",
               "phone_number" => "some phone_number",
               "rut" => "some rut"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.user_path(conn, :create), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "update user" do
    setup [:create_user]

    test "renders user when data is valid", %{conn: conn, user: %User{id: id} = user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @update_attrs)
      assert %{"id" => ^id} = json_response(conn, 200)["data"]

      conn = get(conn, Routes.user_path(conn, :show, id))

      assert %{
               "id" => id,
               "email" => "some updated email",
               "image_url" => "some updated image_url",
               "lastname" => "some updated lastname",
               "name" => "some updated name",
               "password_hash" => "some updated password_hash",
               "phone_number" => "some updated phone_number",
               "rut" => "some updated rut"
             } = json_response(conn, 200)["data"]
    end

    test "renders errors when data is invalid", %{conn: conn, user: user} do
      conn = put(conn, Routes.user_path(conn, :update, user), user: @invalid_attrs)
      assert json_response(conn, 422)["errors"] != %{}
    end
  end

  describe "delete user" do
    setup [:create_user]

    test "deletes chosen user", %{conn: conn, user: user} do
      conn = delete(conn, Routes.user_path(conn, :delete, user))
      assert response(conn, 204)

      assert_error_sent 404, fn ->
        get(conn, Routes.user_path(conn, :show, user))
      end
    end
  end

  defp create_user(_) do
    user = fixture(:user)
    %{user: user}
  end
end
