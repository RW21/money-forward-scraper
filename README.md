# money-forward-scraper

## Requirements

Tested on Racket 8.4.

Requires the following raco packages:
- html-parsing
- sxml
- threading

## Usage

Download html from https://moneyforward.com/cf.

Pass in the downloaded html to the script, it will print the csv to stdout.

`./scraper <html-file> > my.csv`
