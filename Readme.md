**WorkFlow**

- *schema* file includes DB structure (tables, fields)

- owner, first of all, have to build permissions and roles, for example

```
permission_1 = PermissionService.new.create(
  name: 'Allow create employees',
  description: 'User has access to needed sources for create employee',
  rule: 'some rule ...'
)

permission_2 = PermissionService.new.create(
  name: 'Allow remove employees',
  description: 'User has access to needed sources for remove employee',
  rule: 'some rule ...'
)

permission_3 = PermissionService.new.create(
  name: 'Access to Admin side',
  description: 'User can login to admin index page and see list of employees',
  rule: 'some rule ...'
)

```

build new `roles`

```
role = RoleService.new.create(
  name: 'Employee lifecircle',
  description: 'Create/Remove Employee'
)
```

fill in role by permissions

```
RoleService.new(role.id).add_permission(permission_1)
RoleService.new(role.id).add_permission(permission_2)
```

add access to specific `user`, `user`s id we know.

```
user_id = 1
AbilityService.new(user_id, 'Role', role.id).access
AbilityService.new(user_id, 'Permission', permission_3.id).access
```

after this `user` has all our created permissions. First two through `role`, third directly (with `permission_3`)

there is present ability to drop this access

```
user_id = 1
AbilityService.new(user_id, 'Role', role.id).deny
AbilityService.new(user_id, 'Permission', permission_3.id).deny
```
also there are some additional methods, like show all permissions and roles

```
PermissionService.all
RoleService.all
```
and you can remove existing permission or role

```
PermissionService.new(permission_3.id).remove
RoleService.new(role.id).remove
```
BTW, when you remove role, existing permissions which is included in role do not be removed.
