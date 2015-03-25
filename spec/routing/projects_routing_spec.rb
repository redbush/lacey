require 'rails_helper'

RSpec.describe ProjectsController, type: :routing do
  it '"routes to #show' do
    expect(get: '/projects/1').to route_to('projects#show', id: '1')
  end
end
