# Issues

This project is used to fetch GitHub issues, and was created while following
`Programming Elixir 1.6` book, chapter 13 and 14.

## Usage

This project is in its final form and probably won't be updated anymore. To
generate an executable, run `mix escript.build` and it should create an
`issues` file.

To run, simply type in your terminal:

```bash
./issues <user> <repo> <count>
```

For instance, `./issues elixir-lang elixir 10` would fetch the 10 latest open
issues in Elixir's repository, and output in a nice table.
