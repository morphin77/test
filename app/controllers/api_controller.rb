class ApiController < ApplicationController
  def set_user_action_permission
    user_name = params["api"]["user"]
    action_name = params["api"]["action_name"]
    permission_name = params["api"]["permission"]

    result = SetUserActionPermissionService.new.call(
      user_name: user_name,
      action_name: action_name,
      permission_name: permission_name
    )

    render json: result, status: :ok
  end

  def set_role_action_permission
    role_name = params["api"]["role"]
    action_name = params["api"]["action_name"]
    permission_name = params["api"]["permission"]

    result = SetRoleActionPermissionService.new.call(
      role_name: role_name,
      action_name: action_name,
      permission_name: permission_name
    )
    render json: result, status: :ok
  end

  def set_user_resource_permission
    user_name = params["api"]["user"]
    resource_name = params["api"]["resource_name"]
    permission_name = params["api"]["permission"]

    result = SetUserResourcePermissionService.new.call(
      user_name: user_name,
      resource_name: resource_name,
      permission_name: permission_name
    )

    render json: result, status: :ok
  end

  def set_role_resource_permission
    role_name = params["api"]["role"]
    resource_name = params["api"]["resource_name"]
    permission_name = params["api"]["permission"]

    result = SetRoleResourcePermissionService.new.call(
      role_name: role_name,
      resource_name: resource_name,
      permission_name: permission_name
    )
    render json: result, status: :ok
  end

end
