@echo off
setlocal

:: Define webhook URL
set "WEBHOOK_URL=https://discordapp.com/api/webhooks/1328146311064584273/sft2dkzaIgbYVzx6Xm1WKJkRU4hHOoRz2rvHgQg9hmTN42BosnHtu85J0JXn1FG5r0DR"

:: Define message content
set "MESSAGE=Nigga it worked!"

:: Send message using curl
curl -X POST %WEBHOOK_URL% ^
    -H "Content-Type: application/json" ^
    -d "{\"content\": \"%MESSAGE%\"}"

:: Check if curl succeeded
if %ERRORLEVEL% == 0 (
    echo Message sent successfully!
) else (
    echo Failed to send message.
)

endlocal
