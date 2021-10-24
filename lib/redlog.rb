# frozen_string_literal: true

require 'colorize'
require_relative 'redlog/version'
require_relative 'redlog/ascii'
require_relative 'redlog/cli'
require_relative 'redlog/setup'

# Module to interface with the Redmine host at url
module Redlog
  class RedlogError < StandardError; end

  class NoSetupError < RedlogError; end
end
