@echo off
color 0A
title YouTube 24/7 Stream Launcher

:: Check if FFmpeg is installed
where ffmpeg >nul 2>&1
if errorlevel 1 (
    echo.
    echo FFmpeg is not installed or not in PATH.
    echo Download it from: https://www.gyan.dev/ffmpeg/builds/
    echo Put ffmpeg.exe in the same folder or add to system PATH.
    pause
    exit /b
)

echo.
set /p videoPath=Enter path to video file to loop (e.g., C:\video.mp4): 
if not exist "%videoPath%" (
    echo.
    echo File not found! Please check the path and try again.
    pause
    exit /b
)

echo.
set /p streamKey=Enter YouTube stream key: 
if "%streamKey%"=="" (
    echo No stream key entered.
    pause
    exit /b
)

echo.
set /p forceFps=Enter target FPS (default: 30) [press Enter to skip]: 
if "%forceFps%"=="" set forceFps=30

echo.
set /p bitrate=Enter video bitrate in kbps (default: 6000) [press Enter to skip]: 
if "%bitrate%"=="" set bitrate=6000

echo.
set /p bufsize=Enter buffer size in kbps (default: 12000) [press Enter to skip]: 
if "%bufsize%"=="" set bufsize=12000

echo.
echo Starting stream...
echo Press Ctrl+C to stop.
echo.

:: Looping and streaming command
ffmpeg -stream_loop -1 -re -i "%videoPath%" -c:v h264_nvenc -b:v %bitrate%k -bufsize %bufsize%k -maxrate %bitrate%k -g 60 -r %forceFps% -preset p3 -pix_fmt yuv420p -f flv "rtmp://a.rtmp.youtube.com/live2/%streamKey%"

pause
