class SetRoleResourcePermissionService
    def call(role_name:, resource_name:, permission_name:)
      errors = []

      role = Role.find_by(name: role_name)
      unless role.nil?
        role_relations = UserRole.where(role_id: role.id)
        users = User.where(id: role_relations.map(&:user_id))
      else
        errors.push("Role #{role_name} not present")
      end
      result = []
      users.each do |user|
        item = SetUserResourcePermissionService.new.call(
          user_name: user[:name],
          resource_name: resource_name,
          permission_name: permission_name
        )
        if item.is_a? UserResourcePrivilege
          result.push(item) 
        else
          errors += item
        end
      end unless users.nil?

      if errors.any?
        errors.uniq
      else
        result
      end
    end
      
end