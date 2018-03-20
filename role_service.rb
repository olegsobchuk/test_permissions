class RoleService
  def initialize(id = nil)
    @role = id ? Role.find(id) : Role.new
  end


  # create new Role record
  def create(params)
    @role = @role.create(params)
  end

  # remove specific Role
  def remove
    # whould be good to do next two action in single transaction
    @role.remove
    PermissionRole.where(role_id: @role.id).delete_all
  end

  # fetch all Roles from DB
  def all
    Role.all
  end

  # Add permission to specific role
  def add_permission(permission)
    PermissionsRole.create(@role, permission)
  end
end
