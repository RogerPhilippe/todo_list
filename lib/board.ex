defmodule Board do
  defstruct name: nil, items: []

  ## How to use
  ## board = Board.new("tarefas") // Cria lista de tarefas
  ## limpar_casa = Item.new("Limpar casa") // Cria uma tarefa
  ## board = Board.add_item_to_board(board, limpar_casa) // Adiciona tarefa na lista
  ## board = Board.remove_item_from_board(board, limpar_casa) // Remove tarefa da lista
  ## board = Board.mark_item_as_done(board, limpar_cozinha) // Marcar tarefa como realizada
  ## board = Board.mark_item_as_undone(board, limpar_cozinha) // Desmarcar tarefa como realizada

  def new(name, items \\ []) do
    %Board{name: name, items: items}
  end

  def add_item_to_board(%{name: name, items: items}, new_item) do
    new(name, [ new_item | items ])
  end

  def remove_item_from_board(%{name: name, items: items}, item_to_remove) do
    new(name, Enum.reject(items, fn item -> item.description == item_to_remove.description end))
  end

  def mark_item_as_done(board, done_item) do
    ## - Primeira maneira de fazer
    ## - updated_board = remove_item_from_board(board, done_item)
    ## add_item_to_board(updated_board, Item.done(done_item))
    ## - Segunda maneira de fazer - Simplificando um pouco as coisas
    ## add_item_to_board(remove_item_from_board(board, done_item), Item.done(done_item))
    ## - Terceira maneira de fazer - Simplificando ainda mais.
    ## Basicamente passamos board para o primeiro paramêtro da função remove_item_from_board e seu
    ## retorno para o primeiro parâmetro da função add_item_to_board
    board
    |> remove_item_from_board(done_item)
    |> add_item_to_board(Item.done(done_item))
  end

  def mark_item_as_undone(board, undone_item) do
    board
    |> remove_item_from_board(undone_item)
    |> add_item_to_board(Item.undone(undone_item))
  end

end
