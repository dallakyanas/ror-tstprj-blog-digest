module ApplicationHelper
  def has_access(p_controller_name = controller_name, p_action_name = action_name)
    if !current_user
      access_granted = false
    else
      action = Action.where(controller_name: p_controller_name, action_name: p_action_name).take
      role_id = current_user.role_id

      access_granted = action && RoleRight.where(action_id: action.id, role_id: role_id).exists?
    end

    return access_granted
  end
end
