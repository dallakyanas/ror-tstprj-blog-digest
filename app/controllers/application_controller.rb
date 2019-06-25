class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  # before_action :authenticate_user!

  private
    def has_access
      action = Action.where(controller_name: controller_name, action_name: action_name).take
      role_id = current_user.role_id

      unless action && RoleRight.where(action_id: action.id, role_id: role_id).exists?
        flash[:alert] = "Доступ запрещен"
        redirect_to  root_url
      end
    end
end
