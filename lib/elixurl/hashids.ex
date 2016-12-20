defmodule Elixurl.Hashids do
  def start_link do
    config = Hashids.new(Application.get_all_env(:hashids))

    Agent.start_link(fn -> config end, name: __MODULE__)
  end

  def encode(param) when is_integer(param) do
    Agent.get(__MODULE__, fn config -> Hashids.encode(config, param) end)
  end

  def decode(param) when is_bitstring(param) do
    Agent.get(__MODULE__, fn config -> List.first(Hashids.decode!(config, param)) end)
  end
end
