# homebrew-logos

Homebrew tap for [logos](https://github.com/Coder8124/logos).

```sh
brew install coder8124/logos/logos
logos setup
```

`logos setup` wires every MCP host on the machine to
`$(brew --prefix)/opt/logos/bin/logos`, which keeps working after
`brew upgrade logos`. Update with brew; `logos update` defers to it.

## Releasing

After a logos release is published:

```sh
scripts/update-formula.sh v0.4.3
```

This rewrites `Formula/logos.rb` from that release's `SHA256SUMS`.
