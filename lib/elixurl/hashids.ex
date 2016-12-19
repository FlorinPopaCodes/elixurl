defmodule Elixurl.Hashids do
  use GenServer

  # Client API

  def start_link(opts \\ []) do
    GenServer.start_link(__MODULE__, [], opts)
  end

  def encode(param) do
    GenServer.call(:hashids, {:encode, param})
  end

  def decode(param) do
    GenServer.call(:hashids, {:decode, param})
  end

  # Server implementation

  def init([]) do
    config = Hashids.new([
      salt: "123",
      min_len: 2,
    ])
    {:ok, config}
  end

  def handle_call(call, _from, config) do
    case call do
      {:encode, param} ->
        {:reply, {:ok, Hashids.encode(config, param)}, config}
      {:decode, param} ->
        {:reply, Hashids.decode(config, param), config}
    end
  end
end
