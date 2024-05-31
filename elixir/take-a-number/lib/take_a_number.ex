defmodule TakeANumber do
  def start() do
    spawn(&machine/0)
  end

  defp machine(state \\ 0) do
    receive do
      {:report_state, sender} ->
        send(sender, state)
        machine(state)

      {:take_a_number, sender} ->
        send(sender, state + 1)
        machine(state + 1)

      :stop ->
        nil

      _ ->
        machine(state)
    end
  end
end
