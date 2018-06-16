# Tesla Request Id Middleware

[![Build Status](https://travis-ci.org/doughsay/tesla_request_id.svg?branch=master)](https://travis-ci.org/doughsay/tesla_request_id)
[![Code Coverage](https://img.shields.io/codecov/c/github/doughsay/tesla_request_id.svg)](https://codecov.io/gh/doughsay/tesla_request_id)
[![Hex.pm](https://img.shields.io/hexpm/v/tesla_request_id.svg)](http://hex.pm/packages/tesla_request_id)

Tesla middleware for adding x-request-id to outgoing requests.

It takes the `:request_id` property from the Logger metadata and passes it on under the `x-request-id` header in outgoing http requests made through tesla.

## Installation

Add `tesla_request_id` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:tesla_request_id, "~> 0.1.0"}
  ]
end
```

## Usage

```elixir
defmodule MyClient do
  use Tesla
  plug Tesla.Middleware.RequestId
end
```

## Configuration

When adding the middleware, you can specify the name of the header to use for outgoing requests:

```elixir
plug Tesla.Middleware.RequestId, header_name: "x-transaction-id"
```

The docs can
be found at [https://hexdocs.pm/tesla_request_id](https://hexdocs.pm/tesla_request_id).
