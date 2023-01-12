defmodule Issues.GithubIssues do
  @moduledoc"""
  Deals with communication with GitHub, by encapsulating all HTTP request with
  URL, headers and parsing of the response.
  """

  require Logger

  @user_agent [{"User-agent", "Elixir dave@pragprog.com"}]

  def fetch(user, project) do
    Logger.info("Fetching #{user}'s project #{project}")

    user
    |> issues_url(project)
    |> HTTPoison.get(@user_agent)
    |> handle_response()
  end

  @github_url Application.compile_env(:issues, :github_url)

  defp issues_url(user, project), do: "#{@github_url}/repos/#{user}/#{project}/issues"

  defp handle_response({_, %{status_code: status_code, body: body}}) do
    Logger.info("Got response: status_code=#{status_code}")
    Logger.debug(fn -> inspect(body) end)

    {
      status_code |> check_for_error(),
      body |> Poison.Parser.parse!()
    }
  end

  defp check_for_error(200), do: :ok
  defp check_for_error(_), do: :error
end
