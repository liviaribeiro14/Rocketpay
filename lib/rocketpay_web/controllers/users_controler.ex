defmodule RocketpayWeb.UsersController do
  use RocketpayWeb, :controller

  alias Rocketpay.User

  action_fallback RocketpayWeb.FallbackController

  def create(conn, params) do
    with {:ok, %User{} = user} <- Rocketpay.create_user(params) do
      conn
      |> put_status(:created)
      |> render("create.json", user: user)
    end
  end

  # defp handle_response({:ok, %User{} = user}, conn) do
  #  conn
  #  |> put_status(:created)
  #  |> render("create.json", user: user)
  # end

  # defp handle_response({:error, _result} = error, _conn), do: error
end
