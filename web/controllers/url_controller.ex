defmodule Elixurl.UrlController do
  use Elixurl.Web, :controller

  alias Elixurl.Url

  def index(conn, _params) do
    urls = Repo.all(Url)
    render(conn, "index.json", urls: urls)
  end

  def create(conn, %{"url" => url_params}) do
    changeset = Url.changeset(%Url{}, url_params)

    case Repo.insert(changeset) do
      {:ok, url} ->
        conn
        |> put_status(:created)
        |> put_resp_header("location", url_path(conn, :show, url))
        |> render("show.json", url: url)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Elixurl.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    url = Repo.get!(Url, id)
    render(conn, "show.json", url: url)
  end

  def update(conn, %{"id" => id, "url" => url_params}) do
    url = Repo.get!(Url, id)
    changeset = Url.changeset(url, url_params)

    case Repo.update(changeset) do
      {:ok, url} ->
        render(conn, "show.json", url: url)
      {:error, changeset} ->
        conn
        |> put_status(:unprocessable_entity)
        |> render(Elixurl.ChangesetView, "error.json", changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    url = Repo.get!(Url, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(url)

    send_resp(conn, :no_content, "")
  end
end
