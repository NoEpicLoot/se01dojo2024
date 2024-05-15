# Se01dojo2024

start interactive with  
`iex -S mix`  

first import the game module...  
you have to keep a reference to the the gameboard variable by yourself.  
You can use the pipe operator to do so more easily.  
you can render the game status at any given time to the console, and keep going with the next move  

```elixir
alias E01Lightsout, as: Game
Game.start()
|> Game.move(2, 2)
|> Game.render()
|> Game.move(1, 3)
...
```

## Installation

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `se01dojo2024` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:se01dojo2024, "~> 0.1.0"}
  ]
end
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at <https://hexdocs.pm/se01dojo2024>.
