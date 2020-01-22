# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
p "Initialize values"
users = ["John", "Mike", "Paul"]
roles = ["admin", "guest"]
actions = ["reboot_server", "manage_service A", "manage service B", "chown", "chmod"]
resources = [
    {
        name: "file A",
        permissions: ["read", "write", "execute"]
    },
    {
        name: "file B",
        permissions: ["read", "write"]
    },
    {
        name: "shared folder",
        permissions: ["read", "write", "remove"]
    },
    {
        name: "cache directory",
        permissions: ["init", "clean"]
    },
    {
        name: "cloud platform",
        permissions: ["guest", "user", "manager", "admin"]
    }
]

p "fill Users"
users.each {|user| User.create({name: user})}

p "fill Roles"
roles.each {|role| Role.create({name: role})}
UserRole.create(role_id: 1, user_id: 1)
UserRole.create(role_id: 1, user_id: 2)
UserRole.create(role_id: 2, user_id: 3)

p "fill Actions and ActionPermission"
actions.each do |action| 
    action_id = Action.create({name: action}).id
    ActionPermission.create(
        [
            {
                name: "grant",
                action_id: action_id
            },
            {
                name: "revoke",
                action_id: action_id
            },
        ]
    )
end

p "fill Resource and ResourcePermission"
resources.each do |resource| 
    resource_id = Resource.create({name: resource[:name]}).id
    resource[:permissions].each {|permission| ResourcePermission.create({name: permission, resource_id: resource_id})}
end