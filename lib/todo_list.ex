defmodule TodoList do
  @moduledoc """
  Documentation for TodoList.
  """

  @doc """
  Hello world.

  ## Examples

      iex> TodoList.hello()
      :world

  """
  def hello do
    :world
  end

  def showHello(name) do
    name
    |> putSaudacao
    |> IO.puts
  end

  def putSaudacao(name) do
    "Ola, #{name}"
  end

end
