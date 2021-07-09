defmodule CmsPullman.Account do
  @moduledoc """
  The Account context.
  """

  import Ecto.Query, warn: false
  alias CmsPullman.Repo

  alias CmsPullman.Account.Company

  @doc """
  Returns the list of companies.

  ## Examples

      iex> list_companies()
      [%Company{}, ...]

  """
  def list_companies do
    Repo.all(Company)
  end

  @doc """
  Gets a single company.

  Raises `Ecto.NoResultsError` if the Company does not exist.

  ## Examples

      iex> get_company!(123)
      %Company{}

      iex> get_company!(456)
      ** (Ecto.NoResultsError)

  """
  def get_company!(id), do: Repo.get!(Company, id)

  @doc """
  Creates a company.

  ## Examples

      iex> create_company(%{field: value})
      {:ok, %Company{}}

      iex> create_company(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_company(attrs \\ %{}) do
    %Company{}
    |> Company.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a company.

  ## Examples

      iex> update_company(company, %{field: new_value})
      {:ok, %Company{}}

      iex> update_company(company, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_company(%Company{} = company, attrs) do
    company
    |> Company.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a company.

  ## Examples

      iex> delete_company(company)
      {:ok, %Company{}}

      iex> delete_company(company)
      {:error, %Ecto.Changeset{}}

  """
  def delete_company(%Company{} = company) do
    Repo.delete(company)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking company changes.

  ## Examples

      iex> change_company(company)
      %Ecto.Changeset{data: %Company{}}

  """
  def change_company(%Company{} = company, attrs \\ %{}) do
    Company.changeset(company, attrs)
  end

  alias CmsPullman.Account.CustomField

  @doc """
  Returns the list of custom_fields.

  ## Examples

      iex> list_custom_fields()
      [%CustomField{}, ...]

  """
  def list_custom_fields do
    Repo.all(CustomField)
  end

  def list_custom_fields_by_company_id(company_id) do
    CustomField.get_by_company_id(company_id) |> Repo.all
  end

  @doc """
  Gets a single custom_field.

  Raises `Ecto.NoResultsError` if the Custom field does not exist.

  ## Examples

      iex> get_custom_field!(123)
      %CustomField{}

      iex> get_custom_field!(456)
      ** (Ecto.NoResultsError)

  """
  def get_custom_field!(id), do: Repo.get!(CustomField, id)

  @doc """
  Creates a custom_field.

  ## Examples

      iex> create_custom_field(%{field: value})
      {:ok, %CustomField{}}

      iex> create_custom_field(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_custom_field(attrs \\ %{}) do
    %CustomField{}
    |> CustomField.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a custom_field.

  ## Examples

      iex> update_custom_field(custom_field, %{field: new_value})
      {:ok, %CustomField{}}

      iex> update_custom_field(custom_field, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_custom_field(%CustomField{} = custom_field, attrs) do
    custom_field
    |> CustomField.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a custom_field.

  ## Examples

      iex> delete_custom_field(custom_field)
      {:ok, %CustomField{}}

      iex> delete_custom_field(custom_field)
      {:error, %Ecto.Changeset{}}

  """
  def delete_custom_field(%CustomField{} = custom_field) do
    Repo.delete(custom_field)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking custom_field changes.

  ## Examples

      iex> change_custom_field(custom_field)
      %Ecto.Changeset{data: %CustomField{}}

  """
  def change_custom_field(%CustomField{} = custom_field, attrs \\ %{}) do
    CustomField.changeset(custom_field, attrs)
  end

  alias CmsPullman.Account.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  def list_users do
    Repo.all(User)
  end

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  def get_user!(id), do: Repo.get!(User, id)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_user(attrs \\ %{}) do
    %User{}
    |> User.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_user(%User{} = user, attrs) do
    user
    |> User.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  def delete_user(%User{} = user) do
    Repo.delete(user)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  def change_user(%User{} = user, attrs \\ %{}) do
    User.changeset(user, attrs)
  end
end
