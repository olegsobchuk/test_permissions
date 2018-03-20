class PermissionService
  # fetch all permissions from DB
  def self.all
    Permission.all
  end

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
end
