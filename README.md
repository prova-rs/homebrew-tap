# Prova Homebrew Tap

[Prova](https://github.com/prova-rs/prova) is a programmable, language-agnostic black box
acceptance-test runner.

## Installation

```shell
brew tap prova-rs/tap
brew install prova
```

To pin a major line or an exact version:

```shell
brew install prova@0        # latest stable 0.x
brew install prova@0.1.0    # exactly 0.1.0
```

## How formulas get here

Nothing in `Formula/` is hand-edited. Releasing `prova-rs/prova` sends a `repository_dispatch`
(`update-formula`) carrying the version and each platform archive's URL + SHA256; the
[Update Formula](.github/workflows/update_formula.yaml) workflow renders the formulas from the
Archetect archetype in [`archetype/`](archetype) and commits them.

Each release writes up to three formulas:

| Formula | When | Tracks |
| --- | --- | --- |
| `prova@X.Y.Z` | every release, prereleases included | that exact version |
| `prova@X` | stable releases only | latest stable of major line X |
| `prova` | latest stable of the newest major line | the current release |

Prereleases never move `prova` or `prova@X`. Only the 5 most recent pinned formulas per major
line are retained; the `prova@X` aliases are never pruned.
