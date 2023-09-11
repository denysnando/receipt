# Receipt Command Line System

This project demonstrates a text-based command system to generate a receipt implemented in Ruby. It includes two classes, `Base` and `Main`, within the `Command` module, which allow users to select and execute commands from a menu of options.

Requirements based on these [challenges](https://gist.github.com/safplatform/792314da6b54346594432f30d5868f36)

## Features

- Displays a menu of options to the user.
- Accepts user text input to select commands.
- Executes commands based on user input.
- Includes example commands: "Generate a receipt with new products in the basket" and "Generate a random receipt."

## Table of Contents

- [Requirements](#requirements)
- [Installation](#installation)
- [Usage](#usage)
- [Tests](#Tests)

## Requirements

Before running the project, make sure you have the following:

- Ruby installed (version 3.1.2).

## Installation

1. Clone this repository to your local machine:

   ```bash
     git clone https://github.com/denysnando/receipt
   ```
2. Setup
   ```bash
     cd receipt/
     ./bin/setup
   ```

## Usage
  ```bash
    ./bin/shop
  ```

## Tests
  ```bash
    rspec
  ```

## How can it be improved?
- By adding a validation system inside the models;
- Add the simple coverage gem
