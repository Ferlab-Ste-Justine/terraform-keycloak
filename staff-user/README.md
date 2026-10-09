# About

Module that creates an employee's user

## Interface

# Input

- **realm_id**: Id of the realm to create the user in. Users that need to manage more than one realm should be created in the **master** realm.
- **username**: Username of the user. Should be unique. 
- **password**: Password of the user. Will **not** be marked in the keycloak dashboard as needing to be changed. Given the source, it is assumed to have been transmitted through secure channels and to be strong. Changing this value will re-create the user. 
- **email**: Email of the user. Should be unique. Will **not** be marked in the keycloak dashboard as needing confirmation. Given the source, it is assumed to be legitimate.
- **first_name**: First name of the user.
- **last_name**: Last name of the user.
- **role_ids**: Role ids to assign to the user. The list is assumed exhaustive singular source of truth for the roles the user has. Any roles that user has in keycloak are not in the list will be removed.
- **group_ids**: Group ids to assign to the user. The list is assumed exhaustive singular source of truth for the groups the user has. Any groups that user has in keycloak are not in the list will be removed.

# Output

- **user_id**: ID of the generated keycloak user