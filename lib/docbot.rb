require 'slack-ruby-bot'
require 'doc/ruby'

class Docbot < SlackRubyBot::Bot
  match(/hello|hi|hey/i) do |client, data, _match|
    client.say(text: "Hello <@#{data.user}>", channel: data.channel)
  end

  match(/^ri\s+(?<query>.+)\s*$/) do |client, data, match|
    ruby_doc = Doc::Ruby.for(match[:query])
    client.say(text: ruby_doc.to_markdown, channel: data.channel)
  end
end
