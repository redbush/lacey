class ProjectsController < ApplicationController
  before_action :authenticate
  before_action :set_project, only: [:show]

  rescue_from ActiveRecord::RecordNotFound, with: :record_not_found

  def show
  end

  private

  def set_project
    @project = Project.find(params[:id])
  end

  def authenticate
    return if admin_signed_in?
    authenticate_or_request_with_http_basic do |username, password|
      username == SiteProperty.basic_auth_username && password == SiteProperty.basic_auth_password
    end
  end

  private

  def record_not_found
    redirect_to not_found_path
  end
end
