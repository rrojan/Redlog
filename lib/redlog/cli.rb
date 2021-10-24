# frozen_string_literal: true

require 'tty-logger'
require 'tty-prompt'

module Redlog
  # CLI class intended to handle cli related tasks including prompting for input
  # and managing stdout and stderr
  class CLI
    def initialize
      @prompt = TTY::Prompt.new
      @logger = TTY::Logger.new
    end

    # Logger to output message on cli
    # Modes :logger (default), :success, :info, :error
    def log(message, mode = :logger)
      if mode == :logger
        puts message
      else
        @logger.send mode, message
      end
    end

    def setup_prompt
      url = @prompt.ask('Enter server url (Example: https://redmine.youserver.com)') do |u|
        u.validate(%r{(http|https)://\S+}, 'Invalid URL format')
      end
      log "Checking for Redmine server at #{url}...", :info
      sleep 1
      # TODO: check for redmine server at url

      username = @prompt.ask("\nUsername:")
      password = @prompt.mask('Password:', echo: false)
      { username: username, password: password, url: url }
    end
  end
end
