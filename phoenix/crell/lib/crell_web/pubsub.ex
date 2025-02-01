defmodule CrellWeb.Pubsub do

  alias Phoenix.PubSub

  def sub() do
    :ok = PubSub.subscribe(Crell.PubSub, "crell_nodes")
  end

  def broadcast() do
    :ok = PubSub.broadcast(Crell.PubSub, "crell_nodes", {})
  end

end
