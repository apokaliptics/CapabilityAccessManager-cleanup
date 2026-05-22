@echo off
:: Check for Administrator privileges
net session >nul 2>&1
if %errorLevel% == 0 (
    echo [!] Running with Admin privileges...
) else (
    echo [!] ERROR: Please right-click and "Run as Administrator".
    pause
    exit /b
)

echo [1/3] Stopping Capability Access Manager Service...
net stop camsvc /y

echo [2/3] Deleting corrupted database logs...
:: Deleting the WAL and SHM files (the temporary transaction logs)
del /f /q "C:\ProgramData\Microsoft\Windows\CapabilityAccessManager\CapabilityAccessManager.db-wal"
del /f /q "C:\ProgramData\Microsoft\Windows\CapabilityAccessManager\CapabilityAccessManager.db-shm"

echo [3/3] Restarting service...
net start camsvc

echo.
echo Done!
pause