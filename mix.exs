defmodule TeslaRequestId.MixProject do
  use Mix.Project

  def project do
    [
      app: :tesla_request_id,
      version: "0.2.0",
      elixir: "~> 1.5",
      start_permanent: Mix.env() == :prod,
      test_coverage: [tool: ExCoveralls],
      preferred_cli_env: [
        coveralls: :test,
        "coveralls.detail": :test,
        "coveralls.post": :test,
        "coveralls.html": :test,
        "coveralls.json": :test
      ],
      description: description(),
      package: package(),
      deps: deps()
    ]
  end

  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp description do
    """
    Tesla middleware for adding x-request-id to outgoing requests.

    It takes the :request_id property from the Logger metadata and passes it on
    under the x-request-id header in outgoing http requests made through tesla.
    """
  end

  defp package do
    [
      maintainers: ["Chris Dosé <chris.dose@gmail.com>"],
      licenses: ["MIT"],
      links: %{
        "GitHub" => "https://github.com/doughsay/tesla_request_id",
        "Docs" => "https://hexdocs.pm/tesla_request_id"
      }
    ]
  end

  defp deps do
    [
      {:credo, "~> 0.9", only: [:dev, :test], runtime: false},
      {:ex_doc, ">= 0.0.0", only: :dev, runtime: false},
      {:excoveralls, "~> 0.9", only: :test},
      {:tesla, "~> 1.0"}
    ]
  end
end
