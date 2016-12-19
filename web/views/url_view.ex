defmodule Elixurl.UrlView do
  use Elixurl.Web, :view

  def render("index.json", %{urls: urls}) do
    %{data: render_many(urls, Elixurl.UrlView, "url.json")}
  end

  def render("show.json", %{url: url}) do
    %{data: render_one(url, Elixurl.UrlView, "url.json")}
  end

  def render("url.json", %{url: url}) do
    %{id: url.id,
      path: url.path}
  end
end
