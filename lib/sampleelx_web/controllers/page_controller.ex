defmodule SampleelxWeb.PageController do
  use SampleelxWeb, :controller

  def home(conn, _params) do
    # The home page is often custom made,
    # so skip the default app layout.
    render(conn, :home, layout: false)
  end

  def users(conn, _params) do
    IO.puts("Users names and emails!")
    users =[
      %{id: 1, name: "Alice", email: "alice@email.com"},
      %{id: 2, name: "grace", email: "grace@email.com"},

    ]
    #render(conn, :users, users: users, layout: false)
    json(conn, %{users: users})
  end
end
