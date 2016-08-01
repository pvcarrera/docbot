# Docbot
Slack bot that retrieves Core/Stdlib documentation.

## Requirements

Ruby ri docs should be available in the system.

## Installation

```sh
  $ ./script/bootstrap
  $ ./script/setup
```

The setup script will ask you to enter your Slack API token.

## Usage

To run the bot in your local machine:

```sh
  $ script/server
```

## Tests

To run the tests, use:

```sh
  $ script/tests
```

## Use

Once the bot is connected to your Slack, you can send him questions about Ruby documentation as per following syntax:

```sh
  > ri Array#first
```

You can also say hi to the bot or send him a ramdon text, in which case he will respond with an animated gif.


