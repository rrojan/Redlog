# frozen_string_literal: true

RSpec.describe 'Redlog CLI' do
  it 'supports the --help flag' do
    expect { system('exe/redlog --help') }
      .to output(a_string_including('Redmine'))
      .to_stdout_from_any_process
  end
end
