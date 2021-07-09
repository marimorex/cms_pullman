defmodule CmsPullman.AccountTest do
  use CmsPullman.DataCase

  alias CmsPullman.Account

  describe "companies" do
    alias CmsPullman.Account.Company

    @valid_attrs %{email: "some email", facebook: "some facebook", instagram: "some instagram", is_active: true, linkedin: "some linkedin", location: "some location", location_2: "some location_2", phone_number: "some phone_number", phone_number_2: "some phone_number_2"}
    @update_attrs %{email: "some updated email", facebook: "some updated facebook", instagram: "some updated instagram", is_active: false, linkedin: "some updated linkedin", location: "some updated location", location_2: "some updated location_2", phone_number: "some updated phone_number", phone_number_2: "some updated phone_number_2"}
    @invalid_attrs %{email: nil, facebook: nil, instagram: nil, is_active: nil, linkedin: nil, location: nil, location_2: nil, phone_number: nil, phone_number_2: nil}

    def company_fixture(attrs \\ %{}) do
      {:ok, company} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_company()

      company
    end

    test "list_companies/0 returns all companies" do
      company = company_fixture()
      assert Account.list_companies() == [company]
    end

    test "get_company!/1 returns the company with given id" do
      company = company_fixture()
      assert Account.get_company!(company.id) == company
    end

    test "create_company/1 with valid data creates a company" do
      assert {:ok, %Company{} = company} = Account.create_company(@valid_attrs)
      assert company.email == "some email"
      assert company.facebook == "some facebook"
      assert company.instagram == "some instagram"
      assert company.is_active == true
      assert company.linkedin == "some linkedin"
      assert company.location == "some location"
      assert company.location_2 == "some location_2"
      assert company.phone_number == "some phone_number"
      assert company.phone_number_2 == "some phone_number_2"
    end

    test "create_company/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_company(@invalid_attrs)
    end

    test "update_company/2 with valid data updates the company" do
      company = company_fixture()
      assert {:ok, %Company{} = company} = Account.update_company(company, @update_attrs)
      assert company.email == "some updated email"
      assert company.facebook == "some updated facebook"
      assert company.instagram == "some updated instagram"
      assert company.is_active == false
      assert company.linkedin == "some updated linkedin"
      assert company.location == "some updated location"
      assert company.location_2 == "some updated location_2"
      assert company.phone_number == "some updated phone_number"
      assert company.phone_number_2 == "some updated phone_number_2"
    end

    test "update_company/2 with invalid data returns error changeset" do
      company = company_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_company(company, @invalid_attrs)
      assert company == Account.get_company!(company.id)
    end

    test "delete_company/1 deletes the company" do
      company = company_fixture()
      assert {:ok, %Company{}} = Account.delete_company(company)
      assert_raise Ecto.NoResultsError, fn -> Account.get_company!(company.id) end
    end

    test "change_company/1 returns a company changeset" do
      company = company_fixture()
      assert %Ecto.Changeset{} = Account.change_company(company)
    end
  end

  describe "custom_fields" do
    alias CmsPullman.Account.CustomField

    @valid_attrs %{description: "some description", is_active: true, link: "some link", logo: "some logo", name: "some name"}
    @update_attrs %{description: "some updated description", is_active: false, link: "some updated link", logo: "some updated logo", name: "some updated name"}
    @invalid_attrs %{description: nil, is_active: nil, link: nil, logo: nil, name: nil}

    def custom_field_fixture(attrs \\ %{}) do
      {:ok, custom_field} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_custom_field()

      custom_field
    end

    test "list_custom_fields/0 returns all custom_fields" do
      custom_field = custom_field_fixture()
      assert Account.list_custom_fields() == [custom_field]
    end

    test "get_custom_field!/1 returns the custom_field with given id" do
      custom_field = custom_field_fixture()
      assert Account.get_custom_field!(custom_field.id) == custom_field
    end

    test "create_custom_field/1 with valid data creates a custom_field" do
      assert {:ok, %CustomField{} = custom_field} = Account.create_custom_field(@valid_attrs)
      assert custom_field.description == "some description"
      assert custom_field.is_active == true
      assert custom_field.link == "some link"
      assert custom_field.logo == "some logo"
      assert custom_field.name == "some name"
    end

    test "create_custom_field/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_custom_field(@invalid_attrs)
    end

    test "update_custom_field/2 with valid data updates the custom_field" do
      custom_field = custom_field_fixture()
      assert {:ok, %CustomField{} = custom_field} = Account.update_custom_field(custom_field, @update_attrs)
      assert custom_field.description == "some updated description"
      assert custom_field.is_active == false
      assert custom_field.link == "some updated link"
      assert custom_field.logo == "some updated logo"
      assert custom_field.name == "some updated name"
    end

    test "update_custom_field/2 with invalid data returns error changeset" do
      custom_field = custom_field_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_custom_field(custom_field, @invalid_attrs)
      assert custom_field == Account.get_custom_field!(custom_field.id)
    end

    test "delete_custom_field/1 deletes the custom_field" do
      custom_field = custom_field_fixture()
      assert {:ok, %CustomField{}} = Account.delete_custom_field(custom_field)
      assert_raise Ecto.NoResultsError, fn -> Account.get_custom_field!(custom_field.id) end
    end

    test "change_custom_field/1 returns a custom_field changeset" do
      custom_field = custom_field_fixture()
      assert %Ecto.Changeset{} = Account.change_custom_field(custom_field)
    end
  end

  describe "users" do
    alias CmsPullman.Account.User

    @valid_attrs %{email: "some email", image_url: "some image_url", lastname: "some lastname", name: "some name", password_hash: "some password_hash", phone_number: "some phone_number", rut: "some rut"}
    @update_attrs %{email: "some updated email", image_url: "some updated image_url", lastname: "some updated lastname", name: "some updated name", password_hash: "some updated password_hash", phone_number: "some updated phone_number", rut: "some updated rut"}
    @invalid_attrs %{email: nil, image_url: nil, lastname: nil, name: nil, password_hash: nil, phone_number: nil, rut: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Account.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Account.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Account.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Account.create_user(@valid_attrs)
      assert user.email == "some email"
      assert user.image_url == "some image_url"
      assert user.lastname == "some lastname"
      assert user.name == "some name"
      assert user.password_hash == "some password_hash"
      assert user.phone_number == "some phone_number"
      assert user.rut == "some rut"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Account.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Account.update_user(user, @update_attrs)
      assert user.email == "some updated email"
      assert user.image_url == "some updated image_url"
      assert user.lastname == "some updated lastname"
      assert user.name == "some updated name"
      assert user.password_hash == "some updated password_hash"
      assert user.phone_number == "some updated phone_number"
      assert user.rut == "some updated rut"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Account.update_user(user, @invalid_attrs)
      assert user == Account.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Account.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Account.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Account.change_user(user)
    end
  end
end
