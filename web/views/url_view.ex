defmodule Elixurl.UrlView do
  use Elixurl.Web, :view

  alias Elixurl.Hashids

  def render("index.json", %{urls: urls}) do
    %{data: render_many(urls, Elixurl.UrlView, "url.json")}
  end

  def render("show.json", %{url: url}) do
    %{data: render_one(url, Elixurl.UrlView, "url.json")}
  end

  def render("url.json", %{url: url}) do
    %{Hashids.encode(url.id) => url.path}
  end
end
