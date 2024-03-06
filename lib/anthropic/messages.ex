defmodule Anthropic.Messages do
  alias Anthropic.Client

  @type create_params :: %{
          required(:model) => String.t(),
          required(:messages) => [map()],
          required(:max_tokens) => integer(),
          optional(:system) => String.t(),
          optional(:metadata) => map(),
          optional(:stop_sequences) => [String.t()],
          optional(:stream) => boolean(),
          optional(:temperature) => float(),
          optional(:top_p) => float(),
          optional(:top_k) => integer()
        }

  @spec create(Client.client(), create_params(), Keyword.t()) :: Client.result()
  def create(client, params, opts \\ []) do
    opts = Client.with_stream_opts(params, opts)

    client
    |> Client.post("/v1/messages", params)
    |> Client.handle_response(opts)
  end
end
