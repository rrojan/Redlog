# frozen_string_literal: true

module Redlog
  # ASCII art for redlog CLI
  module ASCII
    def self.banner
      "
      ______  _____ ______  _      _____  _____
      | ___ \\|  ___||  _  \\| |    |  _  ||  __ \\
      | |_/ /| |__  | | | || |    | | | || |  \\/
      |    / |  __| | | | || |    | | | || | __
      | |\\ \\ | |___ | |/ / | |____\\ \\_/ /| |_\\ \\
      \\_| \\_|\\____/ |___/  \\_____/ \\___/  \\____/
      ".colorize(:light_red)
    end
  end
end
