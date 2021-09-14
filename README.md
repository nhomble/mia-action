# mia-action
check for developers missing in action

## Usage
This action provides a quick visual aide in small teams when you want quick feedback on who is actively contributing.

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
