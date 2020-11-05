@echo off
title YouTube to MP3
:loop
set /P url=YouTube URL:
youtube-dl -f bestaudio -x --extract-audio --audio-format mp3 %url% -o songs\%%(title)s.^%%(ext)s
@echo.
goto loop
