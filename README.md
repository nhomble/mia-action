# mia-action
check for developers missing in action

## Usage
This action provides a quick visual aide in small teams when you want quick feedback on who is actively contributing.

## Troubleshooting
When using the `actions/checkout` [GitHub action](https://github.com/actions/checkout), remember to checkout a reasonable amount of the git history. By default, the commit depth is just `1`.

### Example
```yml
name: nhomble

on:
  schedule:
    - cron: "0 0 * * *"
  push:
    branches: [ main ]

jobs:
  check-mia:
    runs-on: ubuntu-latest
    name: mia
    steps:
      - name: Checkout
        uses: actions/checkout@v2
      - name: check for nhomble mia
        uses: nhomble/mia-action@v0.1.0
        with:
          author: nhomble
          days: 3
```
