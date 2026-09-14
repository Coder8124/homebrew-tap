# homebrew-tap

Homebrew tap for [logos](https://github.com/Coder8124/logos).

```sh
brew install coder8124/tap/logos-mcp
logos setup
```

The formula is `logos-mcp` because Homebrew already has a `logos`; the command
it installs is `logos`.

`logos setup` wires every MCP host on the machine to
`$(brew --prefix)/opt/logos-mcp/bin/logos`, which keeps working after
`brew upgrade logos-mcp`. Update with brew; `logos update` defers to it.

## Releasing

After a logos release is published:

```sh
scripts/update-formula.sh v0.4.3
```

This rewrites `Formula/logos-mcp.rb` from that release's `SHA256SUMS`.
