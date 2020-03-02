defmodule MyPhoenixApp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  alias MyPhoenixApp.Accounts.Credential

  schema "users" do
    field :email, :string
    field :name, :string

    has_one :credential, Credential

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:name, :email])
    |> validate_required([:name, :email])
    |> unique_constraint(:email)
  end
end
