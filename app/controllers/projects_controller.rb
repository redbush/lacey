class ProjectsController < ApplicationController
  before_action :set_project, only: [:show]

  # TODO: authenticate

  def show
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end
end
