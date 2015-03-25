require 'rails_helper'

RSpec.describe ErrorController, type: :request do
  it 'get not_found returns success' do
    get not_found_path
    expect(response).to have_http_status(200)
    expect(response).to render_template(:not_found)
    expect(response).to render_template('layouts/application')
  end
end
