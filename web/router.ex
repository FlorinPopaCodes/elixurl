defmodule Elixurl.Router do
  use Elixurl.Web, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", Elixurl do
    pipe_through :api

    resources "/urls", UrlController, except: [:new, :edit]
  end
end
