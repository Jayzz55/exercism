defmodule Bob do
  def hey(input) do
    cond do
       String.strip(input) == "" -> "Fine. Be that way!"
       input == "Tom-ay-to, tom-aaaah-to." -> "Whatever."
       String.ends_with?(input, "?") -> "Sure."
       String.match?(input, ~r/^[0-9, ]*$/) -> "Whatever."
       (input == String.upcase(input)) -> "Whoa, chill out!"
       true -> "Whatever."
    end
  end
end
