class PagesController < ApplicationController
  before_action :authenticate

  def home
  end

  private

  def authenticate
    return if admin_signed_in?
    authenticate_or_request_with_http_basic do |username, password|
      username == SiteProperty.basic_auth_username && password == SiteProperty.basic_auth_password
    end
  end
end
