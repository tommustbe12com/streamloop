# Streamloop: An easy way to loop youtube live stream using an input video and ffmpeg
### Created by TomMustBe12
This is a batch file (windows based) that runs an ffmpeg script to ask for your input file path, and your youtube stream key. After receiving it, it will start streaming that video looped to that RTMP YouTube live stream, and you can run it in the background. Press Ctrl+C twice to stop the stream.

Uses ffmpeg, a great tool that popular recorders like OBS Studio use. Credit goes to creators of ffmpeg 100%, as all I did was make a quick shortcut for a looped video stream.

Please give credit in stream description (not required, but requested) to me and creators of ffmpeg.

Thanks, and enjoy!

## Requirements
ffmpeg - You can download and install ffmpeg [here](https://ffmpeg.org/download.html)

Windows only - you can only run this batch script on windows. However I am planning on adding Linux/macOS versions.

## Usage
It will ask for file path first, put in your path to your looping video. any video format is fine, make sure it is the AVC (h.264) codec.
It will then ask for your YouTube live stream key, which is given in YouTube studio. Just give it the key directly, do not give it a stream url.
Then, set your buffer/bitrate settings. Usually the ones default are fine for your setup.
You can also choose a custom FPS amount, but be careful not to set it higher than your video's FPS max is because that would mean it would generate duplicate frames which is A) a waste of GPU and CPU usage and B) not good for YouTube if over 60 fps. (YouTube caps at 60fps)
Finally, type "Y" to confirm the stream settings, and it should start streaming. The very last line will show your stream quality/settings.

Then, leave this window open and move on in your pc to do something else! It automatically loops and you don't have to worry about anything.

## Download
Just download streamloop.bat and run it. There is also an exe format if you'd like.
