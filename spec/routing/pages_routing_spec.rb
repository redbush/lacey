require 'rails_helper'

RSpec.describe PagesController, type: :routing do
  it 'GET home routes to pages#home' do
    expect(get: home_path).to route_to(
                               controller: 'pages',
                               action: 'home'
                           )
  end
end
