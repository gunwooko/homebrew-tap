# homebrew-tap

Homebrew formulae for [gunwooko](https://github.com/gunwooko)'s tools.

## Usage

```sh
brew install gunwooko/tap/devx
```

If Homebrew refuses to load the formula from an untrusted tap, trust it first:

```sh
brew trust gunwooko/tap
```

## Updating a formula

After tagging a new devx release:

```sh
./update-devx.sh v0.2.0
git commit -am "devx v0.2.0"
git push
```
