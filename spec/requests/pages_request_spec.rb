require 'rails_helper'

RSpec.describe PagesController, type: :request do
  it 'get home returns success' do
    get home_path
    expect(response).to have_http_status(200)
    expect(response).to render_template(:home)
    expect(response).to render_template('layouts/application')
  end
end
