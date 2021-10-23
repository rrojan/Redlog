# frozen_string_literal: true

require 'aescrypt'
require 'base64'
require 'json'
require_relative '../redlog'

module Redlog
  # setup user credentials and url to interface with redmine api
  class Setup
    @key = 'Cq?ypz4HBo'
    @credential_keys = %i[username password url]
    @counter = 1

    def self.setup_credentials(creds_hash)
      raise 'Keys not found' unless all_cred_keys_present? creds_hash

      encrypt_values! creds_hash
      write_to_config_file creds_hash
    end

    def self.credentials
      read_from_config
    end

    def self.all_cred_keys_present?(creds_hash, keys_arr = @credential_keys)
      (keys_arr - creds_hash.keys).empty?
    end

    def self.encrypt_values!(creds_hash)
      creds_hash.each_key do |key|
        value = AESCrypt.encrypt(creds_hash[key], @key)
        creds_hash[key] = value
      end
    end

    def self.decrypt_values!(creds_hash)
      creds_hash.each_key do |key|
        value = AESCrypt.decrypt(creds_hash[key], @key)
        creds_hash[key] = value
      end
    end

    def self.write_to_config_file(creds_hash)
      File.open('.redlog', 'w+') { |file| file.write(creds_hash.to_json) }
    end

    def self.read_from_config
      values = []
      file = File.read('.redlog')
      creds_hash = JSON.parse(file)
      # convert keys from string to sym
      creds_hash.transform_keys!(&:to_sym)

      raise 'Keys not present in config' unless all_cred_keys_present? creds_hash

      decrypt_values! creds_hash

      @credential_keys.each { |key| values << creds_hash[key] }
      values
    end

    private_class_method :all_cred_keys_present?,
                         :encrypt_values!,
                         :decrypt_values!,
                         :write_to_config_file,
                         :read_from_config
  end
end
