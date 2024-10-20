defmodule PentoWeb.WrongLive do
  use PentoWeb, :live_view
  require Phoenix.LiveView


  def mount(_params, session, socket) do

    # How we can make this into a shared lib ( And prints __ENV_.line of where it's used)
    # IO.inspect(
    #   socket,
    #   label: Atom.to_string(__MODULE__) <> ":" <> Integer.to_string(__ENV__.line),
    #   printable_limit: :infinity,
    #   limit: :infinity
    # )

    guess_number = :rand.uniform(10)
    {
      :ok,
      assign(
        socket,
        score: 0,
        message: "Make a guess",
        time: time(),
        guess_number: guess_number,
        correct_guess?: false,
        session_id: session["live_socket_id"]
      )
    }

    # {:ok, set_initial_state(session, socket)}
  end

  @spec render(any) :: Phoenix.LiveView.Rendered.t()
  def render(assigns) do
    ~H"""
    <h1>Your score: <%= @score %></h1>
    <h2>
      <%= @message %>
      It's <%= @time %>
    </h2>
    <h2>
      <%= for n <- 1..10 do %>
        <.link href="#" phx-click="guess" phx-value-number= {n} >
          <%= n %>
        </.link>
      <% end %>
      <pre>
        <%= @current_user.email %>
        <%= @session_id %>
      </pre>
    </h2>
    <%= if @correct_guess? do %>
      <h2>
        Game Over! you win
        <.link patch={~p"/guess"}>Reset game</.link>
      </h2>
    <% end %>
    """
  end

  def handle_event("guess", %{"number" => guess} = _data, socket) do
    time = time()
    correct_guess? = String.to_integer(guess) == socket.assigns.guess_number
    {score, message} =
      if correct_guess? do
        {socket.assigns.score + 1, "Your guess: #{guess}. Correct. Guess again. "}
      else
        {socket.assigns.score - 1, "Your guess: #{guess}. Wrong. Guess again. "}
      end
    {:noreply, assign(socket, message: message, score: score, time: time, correct_guess?: correct_guess?)}
  end

  def handle_params(_unsigned_params, _uri, socket) do
    # IO.inspect(
    #   unsigned_params,
    #   label: Atom.to_string(__MODULE__) <> ":" <> Integer.to_string(__ENV__.line),
    #   printable_limit: :infinity,
    #   limit: :infinity
    # )
    # IO.inspect(
    #   uri,
    #   label: Atom.to_string(__MODULE__) <> ":" <> Integer.to_string(__ENV__.line),
    #   printable_limit: :infinity,
    #   limit: :infinity
    # )
    # IO.inspect(
    #   socket,
    #   label: Atom.to_string(__MODULE__) <> ":" <> Integer.to_string(__ENV__.line),
    #   printable_limit: :infinity,
    #   limit: :infinity
    # )
    guess_number = :rand.uniform(10)
    {
      :noreply,
      assign(
        socket,
        score: 0,
        message: "Make a guess",
        time: time(),
        guess_number: guess_number,
        correct_guess?: false
      )
    }
  end

  defp time() do
    DateTime.utc_now |> to_string
  end

end
