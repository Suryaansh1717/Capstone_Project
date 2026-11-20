# Project 5: Secure Linux Server Permissions

## Objective
Implement role-based access control (RBAC) on an Ubuntu Linux server using Linux users, groups, ownership (`chown`), and file mode permissions (`chmod`) to enforce least-privilege access.

## Implementation Summary
1. **Groups & Users Created:**
   - Created `developers` and `auditors` groups using `groupadd`.
   - Provisioned `dev_user` (assigned to `developers`) and `audit_user` (assigned to `auditors`) via `useradd`.
2. **Directory & File Hardening:**
   - Created `/srv/dev_secrets` containing `secrets.txt`.
   - Assigned ownership to `root:developers` (`chown -R root:developers /srv/dev_secrets`).
   - Applied `chmod 2770` (`drwxrws---`) on the directory (enforcing the SetGID bit so new files inherit the `developers` group and stripping all permissions for `others`) and `chmod 660` (`-rw-rw----`) on `secrets.txt`.
3. **Verification Results:**
   - **Allowed (`dev_user`):** Successfully read and appended data to `/srv/dev_secrets/secrets.txt`.
   - **Denied (`audit_user`):** Blocked with `Permission denied` when attempting to list directory contents or read `secrets.txt`.
