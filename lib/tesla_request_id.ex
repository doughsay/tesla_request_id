defmodule Tesla.Middleware.RequestId do
  @moduledoc """
  Takes the `:request_id` property from the Logger metadata and passes it on in a header.
  (defaults to `"x-request-id"`).

  ### Example usage
  ```
  defmodule MyClient do
    use Tesla
    plug Tesla.Middleware.RequestId, header_name: "x-transaction-id"
  end
  ```
  """

  require Logger

  @behaviour Tesla.Middleware
  @header_name "x-request-id"

  @impl true
  def call(env, next, opts) do
    env
    |> add_request_id(opts)
    |> Tesla.run(next)
  end

  defp add_request_id(env, opts) do
    header_name = Keyword.get(opts, :header_name, @header_name)

    case Logger.metadata()[:request_id] do
      nil -> env
      id -> Tesla.put_header(env, header_name, id)
    end
  end
end
