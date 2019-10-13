defmodule Item do
  defstruct description: nil, done: false

  def new(description, done \\ false) do
    %Item{description: description, done: done}
  end

  def done(item) do
    %{item | done: true}
  end

  def undone(item) do
    %{item | done: false}
  end

end
