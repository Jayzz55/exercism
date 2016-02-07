defmodule ListOps do
  # Please don't use any external modules (especially List) in your
  # implementation. The point of this exercise is to create these basic functions
  # yourself.
  #
  # Note that `++` is a function from an external module (Kernel, which is
  # automatically imported) and so shouldn't be used either.

  @spec count(list) :: non_neg_integer
  def count(l), do: count_iter(l, 0)

  defp count_iter([], acc), do: acc
  defp count_iter([_ | tail], acc), do: count_iter(tail, acc+1)

  @spec reverse(list) :: list
  def reverse(l), do: reverse_iter(l, [])

  defp reverse_iter([], acc), do: acc
  defp reverse_iter([item | tail], acc), do: reverse_iter( tail, [item | acc])

  @spec map(list, (any -> any)) :: list
  def map(l, f) do
    l
    |> map_iter(f, [])
    |> reverse
  end

  defp map_iter([], _, acc), do: acc
  defp map_iter([item | tail], f, acc), do: map_iter( tail, f, [f.(item) | acc])

  @spec filter(list, (any -> as_boolean(term))) :: list
  def filter([], _), do: []
  def filter( [head | tail], f) do
    filter_iter([head | tail], f, f.(head), []) |> reverse
  end

  defp filter_iter([], _, _, acc), do: acc
  defp filter_iter([item | tail], f, true, acc), do: filter_iter(tail, f, eval_tail(tail, f), [item | acc])
  defp filter_iter([ _ | tail], f, false, acc), do: filter_iter(tail, f, eval_tail(tail, f), acc)

  defp eval_tail([], _), do: false
  defp eval_tail([ head | _ ], f), do: f.(head)

  @type acc :: any
  @spec reduce(list, acc, ((any, acc) -> acc)) :: acc
  def reduce([], acc, _), do: acc
  def reduce([head | tail], acc, f), do: reduce(tail, f.(head, acc), f)

  @spec append(list, list) :: list
  def append(list1, list2), do: append_iter(reverse(list1), list2)

  defp append_iter([], list), do: list
  defp append_iter([head | tail], list), do: append_iter(tail, [head | list])

  @spec concat([[any]]) :: [any]
  def concat(ll) do 
    ll 
    |> reverse 
    |> reduce([], &append(&1, &2))
  end
end
