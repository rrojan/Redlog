# frozen_string_literal: true

RSpec.describe Redlog do
  it 'has a version number' do
    expect(Redlog::VERSION).not_to be nil
  end

  it 'logs in user' do
    expect(described_class.login).to eq(true)
  end
end
