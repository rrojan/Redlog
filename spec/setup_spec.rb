# frozen_string_literal: true

require 'byebug'

RSpec.describe Redlog::Setup do
  describe '#setup_credentials' do
    it 'saves user setup' do
      test_user = { username: 'test', password: 'test', url: 'https://test.com' }
      is_setup = Redlog::Setup.setup_credentials(test_user)
      expect(is_setup).to be true
    end
  end

  describe '#credentials' do
    it 'fetches user credentials' do
      creds_hash = Redlog::Setup.credentials
      expect(creds_hash[:username]).to eq 'test'
      expect(creds_hash[:password]).to eq 'test'
      expect(creds_hash[:url]).to eq 'https://test.com'
    end
  end
end
