chcp 65001

@echo off

for /r %%a in (*.webp) do (
    cd %%~pa
    magick convert %%a %%~na.jpg
    cd..
)

pause