# frozen_string_literal: true

require 'aescrypt'
require 'base64'
require 'json'

module Redlog
  # setup user credentials and url to interface with redmine api
  module Setup
    @encryption_key = 'Cq?ypz4HBo'
    @credential_keys = %i[username password url]

    def self.setup_credentials(creds_hash, filename = '.redlog')
      raise 'Keys not found' unless all_cred_keys_present? creds_hash

      encrypt_values! creds_hash
      write_to_config_file(filename, creds_hash)
    end

    def self.credentials
      read_from_config
    end

    def self.all_cred_keys_present?(creds_hash, keys_arr = @credential_keys)
      (keys_arr - creds_hash.keys).empty?
    end

    def self.encrypt_values!(creds_hash)
      creds_hash.each_key { |key| creds_hash[key] = AESCrypt.encrypt(creds_hash[key], @encryption_key) }
    end

    def self.decrypt_values!(creds_hash)
      creds_hash.each_key { |key| creds_hash[key] = AESCrypt.decrypt(creds_hash[key], @encryption_key
      ) }
    end

    def self.write_to_config_file(filename, creds_hash)
      File.open(filename, 'w+') { |file| file.write(creds_hash.to_json) } and true
    end

    def self.read_from_config(filename = '.redlog')
      file = File.read(filename)
      creds_hash = JSON.parse(file)
      # convert keys from string to sym
      creds_hash.transform_keys!(&:to_sym)

      raise 'Keys not present in config' unless all_cred_keys_present? creds_hash

      decrypt_values! creds_hash
    end

    private_class_method :all_cred_keys_present?,
                         :encrypt_values!,
                         :decrypt_values!,
                         :write_to_config_file,
                         :read_from_config
  end
end
