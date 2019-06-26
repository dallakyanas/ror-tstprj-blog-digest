class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  include ApplicationHelper

  private
    def check_access
      unless has_access
        flash[:alert] = "Доступ запрещен"
        redirect_to  root_url
      end
    end

end
