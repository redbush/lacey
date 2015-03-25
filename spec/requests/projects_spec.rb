require 'rails_helper'

RSpec.describe ProjectsController, type: :request do
  let(:project) { create(:project) }

  it 'get show returns success' do
    get project_path(project)
    expect(response).to have_http_status(200)
    expect(response).to render_template(:show)
    expect(response).to render_template('layouts/application')
  end
end
