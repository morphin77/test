class SetUserActionPermissionService
    def call(user_name:, action_name:, permission_name:)      
      errors = []
      user = User.find_by(name: user_name)
      errors.push("User #{user_name} not present") if user.nil?

      action = Action.find_by(name: action_name)

      unless action.nil?
        permission = action.action_permissions.detect{|item| item[:name] == permission_name}
        errors.push("Permission #{permission_name} not present") if permission.nil?
      else
        errors.push("Action #{action_name} not present")
        errors.push("Permission for #{action_name} not found")
      end

      if errors.any?
        errors
      else
        UserActionPrivilege.find_or_create_by(user_id: user.id, action_id: action.id, action_permission_id: permission.id)
      end
    end    
end