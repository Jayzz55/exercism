defmodule Acronym do
  @doc """
  Generate an acronym from a string. 
  "This is a string" => "TIAS"
  """
  @spec abbreviate(string) :: String.t()
  def abbreviate(string) do
    string
    |> split_blank
    |> map_acronym
    |> Enum.join
  end

  def split_blank(string), do: String.split(string, " ")

  def map_acronym(list) do
    # Enum.map(list, fn(x1) -> Enum.filter(String.split(x1, ""), fn(x2) -> x2 == String.upcase(x2) end ) end)
    list
    |> Enum.map(&(extract_acronym(&1)))
    |> List.flatten
    |> Enum.map(&(String.upcase(&1)))
    |> Enum.filter(&(String.match?(&1, ~r/[A-Z]/)))
  end

  def extract_acronym(string) do
    string
    |> String.split("")
    |> Enum.filter(&(is_acronym?(string, &1)))
  end

  def is_acronym?(string, letter), do: is_upcase?(letter) || is_first_letter?(string, letter)

  def is_first_letter?(string, letter), do: String.first(string) == letter

  def is_upcase?(letter), do: letter == String.upcase(letter)
end
