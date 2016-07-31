$LOAD_PATH.unshift File.expand_path('../lib', __FILE__)
require 'docbot'

require 'dotenv'
Dotenv.load

Docbot.run

run proc { |_env| ['200', {}, ['Docbot lives here']] }
