class PermissionService
  def ininialize(id = nil)
    @permission = id ? Permission.find(id) : Permission.new
  end

  # create new Permission record
  def create(params)
    @permission.create(params)
  end

  # remove specific Permission
  def remove
    @permission.remove
  end

  # fetch all permissions from DB
  def all
    Permission.all
  end
end
