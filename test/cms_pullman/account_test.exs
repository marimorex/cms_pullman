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
end
