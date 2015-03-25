require 'rails_helper'

RSpec.describe ErrorController, type: :routing do
  it 'GET not_found routes to error#not_found' do
    expect(get: not_found_path).to route_to(
                               controller: 'error',
                               action: 'not_found'
                           )
  end
end
