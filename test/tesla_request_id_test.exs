defmodule TeslaRequestIdTest do
  use ExUnit.Case
  alias Tesla.Env

  @middleware TeslaRequestId.Middleware

  test "with no request_id, it has no effect on the headers" do
    assert {:ok, env} = @middleware.call(%Env{headers: [{"authorization", "secret"}]}, [], [])
    assert env.headers == [{"authorization", "secret"}]
  end

  test "with a request_id, it adds a header" do
    Logger.metadata(request_id: "123456789")
    assert {:ok, env} = @middleware.call(%Env{headers: [{"authorization", "secret"}]}, [], [])
    assert env.headers == [{"authorization", "secret"}, {"x-request-id", "123456789"}]
  end

  test "using a custom header name" do
    Logger.metadata(request_id: "123456789")

    assert {:ok, env} =
             @middleware.call(
               %Env{headers: [{"authorization", "secret"}]},
               [],
               header_name: "x-transaction-id"
             )

    assert env.headers == [{"authorization", "secret"}, {"x-transaction-id", "123456789"}]
  end
end
