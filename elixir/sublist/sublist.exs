defmodule Sublist do
  @doc """
  Returns whether the first list is a sublist or a superlist of the second list
  and if not whether it is equal or unequal to the second list.
  """
  def compare(a, a), do: :equal
  def compare(a, b) do
    cond do
      sublist?(a, b) ->
        :sublist
      sublist?(b, a) ->
        :superlist
      true ->
        :unequal
    end
  end

  def sublist?(sub, full) do
    sub_count = Enum.count(sub)

    cond do
      sub_count > Enum.count(full) ->
        false
      Enum.take(full, sub_count) === sub ->
        true
      true ->
        [_ | full_tail] = full
        sublist?(sub, full_tail)
    end
  end
end
