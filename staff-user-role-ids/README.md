# About

Module that returns the correct role ids to assign to an employee.

## Interface

# Input

- **realm_name**: Name of the realm the roles are for
- **master_realm_user"**: Whether the user to assign the roles to is a user in the master realm (which will influence which clients are used)
- **management_roles**: Realm management roles to assign to the user
- **account_roles**: Own account manage roles to assign to the user. Note that this should only be set if **realm_name** is the user's own realm.

# Output

- **role_ids**: List of role ids to assign to the user

# Clients Containing the Roles

For account roles, the **account** client in the target realm is always used.

For management roles:
- If **master_realm_user"** is true, the `<realm name>-realm` client in the master realm is used
- If **master_realm_user"** is false, the **realm-management** client in the target realm is used

# Assigning Roles To Same User Accross Different Realms

Users in realm other than **master** can only have roles from their realms and for them, a single invocation of this module should be able to assign all the roles they will need.

Users in the **master** realms can have roles from different realms. For them, you can invoque this module several time for each realm they should have access to and concatenate the resulting role ids lists together.