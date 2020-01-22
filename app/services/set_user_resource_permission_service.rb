class SetUserResourcePermissionService
    def call(user_name:, resource_name:, permission_name:)      
      errors = []
      user = User.find_by(name: user_name)
      errors.push("User #{user_name} not present") if user.nil?

      resource = Resource.find_by(name: resource_name)

      unless resource.nil?
        permission = resource.resource_permissions.detect{|item| item[:name] == permission_name}
        errors.push("Permission #{permission_name} not present") if permission.nil?
      else
        errors.push("resource #{resource_name} not present")
        errors.push("Permission for #{resource_name} not found")
      end

      if errors.any?
        errors
      else
        UserResourcePrivilege.find_or_create_by(user_id: user.id, resource_id: resource.id, resource_permission_id: permission.id)
      end
    end    
end