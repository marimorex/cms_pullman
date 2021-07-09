defmodule CmsPullmanWeb.UserView do
  use CmsPullmanWeb, :view
  alias CmsPullmanWeb.UserView

  def render("index.json", %{users: users}) do
    %{users: render_many(users, UserView, "user.json")}
  end

  def render("show.json", %{user: user}) do
    %{user: render_one(user, UserView, "user.json")}
  end

  def render("user.json", %{user: user}) do
    %{
      user_id: user.user_id,
      company_id: user.company_id,
      name: user.name,
      lastname: user.lastname,
      email: user.email,
      password_hash: user.password_hash,
      rut: user.rut,
      image_url: user.image_url,
      phone_number: user.phone_number
    }
  end
end
