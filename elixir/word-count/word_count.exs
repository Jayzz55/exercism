defmodule Words do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map()
  def count(sentence) do
    sentence
    |> String.downcase
    |> String.split([" ", "_", ":"])
    |> Enum.reject(&(&1 == ""))
    |> Enum.map(&clean_word(&1))
    |> count_words
  end

  defp clean_word(word) do
    Regex.scan(~r/(*UTF)[\p{L}0-9-]/, word)
    |> Enum.join
  end

  defp count_words(list) do
    Enum.reduce(list, %{}, &update_map/2)
  end

  defp update_map(word, acc) do
    Map.update(acc, word, 1, &(&1 + 1))
  end
end
