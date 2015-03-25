require 'rails_helper'

RSpec.describe ProjectsController, type: :controller do
  let(:project) { create(:project) }

  context 'GET #show' do
    it 'assigns the requested project as @project' do
      get :show, {id: project.to_param}
      expect(assigns(:project)).to eq(project)
    end
  end
end
