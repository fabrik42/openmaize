defmodule Openmaize.Tools do
  @moduledoc """
  """

  import Plug.Conn

  def redirect_page(conn, address) do
    conn = send_message(conn,
    %{:info => "Higher authorities say you must go to #{address}"})
    if Mix.env == :dev, do: host = "localhost:4000", else: host = conn.host
    uri = "#{conn.scheme}://#{host}#{address}"
    conn |> put_resp_header("location", uri) |> send_resp(301, "") |> halt
  end

  def redirect_to_login(conn) do
    redirect_page(conn, "/users/login")
  end

  def send_message(conn, message) do
    if Map.get(conn.private, :phoenix_flash) do
      put_private(conn, :phoenix_flash, message)
    else
      IO.inspect message
      conn
    end
  end

end