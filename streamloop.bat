@echo off
:: Set text colors for a nice effect
color 0A

:: Check if FFmpeg is installed
ffmpeg -version >nul 2>nul
IF %ERRORLEVEL% NEQ 0 (
    echo.
    echo FFmpeg is not installed. You can install it from:
    echo.
    echo https://ffmpeg.org/download.html
    echo.
    pause
    exit /b
)

:: Displaying starting message
cls
echo.
echo =======================
echo YouTube Stream Automation
echo =======================
echo.
echo Please enter the file path of the video you want to stream:
set /p "video_file=File path (e.g., C:\path\to\video.mp4): "
echo.

echo Enter your YouTube stream key:
set /p "stream_key=Stream Key: "
echo.

:: Set default values
set fps=30
set bitrate=4500k
set buffer_size=9000k

:: Ask if user wants to change FPS, Bitrate, or Buffer Size
echo Do you want to customize the FPS (default: 30)? (Y/N)
set /p "custom_fps="
if /i "%custom_fps%"=="Y" (
    set /p "fps=Enter desired FPS (e.g., 30, 60): "
)

echo Do you want to customize the Bitrate (default: 4500k)? (Y/N)
set /p "custom_bitrate="
if /i "%custom_bitrate%"=="Y" (
    set /p "bitrate=Enter desired Bitrate (e.g., 4500k): "
)

echo Do you want to customize the Buffer Size (default: 9000k)? (Y/N)
set /p "custom_buffer="
if /i "%custom_buffer%"=="Y" (
    set /p "buffer_size=Enter desired Buffer Size (e.g., 9000k): "
)

:: Display the chosen settings
echo.
echo You have selected the following settings:
echo Video File: %video_file%
echo Stream Key: %stream_key%
echo FPS: %fps%
echo Bitrate: %bitrate%
echo Buffer Size: %buffer_size%
echo.

:: Confirm to start the stream
echo Are you ready to start streaming? (Y/N)
set /p "start_stream="
if /i "%start_stream%" NEQ "Y" (
    echo Stream cancelled.
    pause
    exit /b
)

:: Start streaming using FFmpeg
echo Starting stream to YouTube...
ffmpeg -re -stream_loop -i "%video_file%" -c:v libx264 -preset veryfast -b:v %bitrate% -maxrate %bitrate% -bufsize %buffer_size% -r %fps% -g %fps% -f flv rtmp://a.rtmp.youtube.com/live2/%stream_key%

:: End of script
echo.
echo Streaming is complete. Press any key to exit.
pause >nul
exit
