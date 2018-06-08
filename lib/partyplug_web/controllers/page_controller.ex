defmodule PartyplugWeb.PageController do
  use PartyplugWeb, :controller

  def index(conn, _params) do
    render conn, "index.html"
  end
end
