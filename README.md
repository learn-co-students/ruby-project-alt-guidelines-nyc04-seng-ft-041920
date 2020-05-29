Green Fairy
========================

Green Fairy is a CLI app that helps you to schedule and manage watering your plants.
Built using Ruby and Active Record.

---
![GreenFairy](https://ibb.co/MPXZDLX)

## Getting Started

1. Clone this repository onto your local machine.
2. Run `bundle install` to download all the necessary gems.
3. Run `rake db:migrate` to create the database.
4. Run `rake db:seed` to seed the database with some auto-generated data.
5. Once you've installed everything smoothly, run `ruby bin/run.rb` to start the app!

## User Flow
* create an username
         |
         v
* See all my plants
* Add new lant
* Delete my account
* Quit

## Sub Menu
* Water plant -> (change watering status or cycle)
* Add new plant
* Change nickname
* Delete plants

---

## Built With

Below are some Gems and links that I used:

* [Faker](https://github.com/faker-ruby/faker): fake data generator
* [TTY::Prompt](https://github.com/piotrmurach/tty-prompt): interactive command line prompt
* [Paint](https://github.com/fazibear/colorize): simple and powerful way to add colors to text
* [Terminal-table](https://github.com/ruby/date): simple way to make table
* [Text to ASCII Art Generator](https://fsymbols.com/generators/carty/): generates ASCII fonts
* [ASCII Art Collection](https://asciiart.website/): Christopher Johnson's ASCII Art Collection
* [ASCII Art Archive](https://www.asciiart.eu/): collection of ASCII art

