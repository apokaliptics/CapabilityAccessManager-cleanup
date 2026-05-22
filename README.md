# CapabilityAccessManager-cleanup

## Overview

`CapabilityAccessManager-cleanup` is a small utility repository for immediately cleaning up a bloated or corrupted Windows Capability Access Manager installation.

The included `bloat.bat` script stops the `Capability Access Manager` service, removes temporary transaction log files that can cause the service to inflate or fail, and restarts the service.

## Why this exists

Windows may accumulate stale or corrupted Capability Access Manager database logs in:

- `C:\ProgramData\Microsoft\Windows\CapabilityAccessManager\CapabilityAccessManager.db-wal`
- `C:\ProgramData\Microsoft\Windows\CapabilityAccessManager\CapabilityAccessManager.db-shm`

This repo provides a straightforward cleanup helper for those cases.

## Included script

- `bloat.bat` — cleans up the Capability Access Manager temporary logs and restarts the service.

### What `bloat.bat` does

1. Verifies the script is running with Administrator privileges
2. Stops the `camsvc` service
3. Deletes the WAL and SHM transaction log files from the Capability Access Manager database folder
4. Restarts the `camsvc` service

## Usage

1. Clone this repository:

```powershell
git clone https://github.com/apokaliptics/CapabilityAccessManager-cleanup.git
cd CapabilityAccessManager-cleanup
```

2. Run the cleanup script as Administrator:

```powershell
.\bloat.bat
```

If the script is not run with elevated privileges, it will prompt you to rerun it as Administrator.

## Notes

- This repository is intentionally lightweight and focused on cleanup.
- Use this only when `Capability Access Manager` is malfunctioning or its temporary database logs need removal.
- Do not delete files from the Capability Access Manager folder unless you understand the risk and have a backup.
