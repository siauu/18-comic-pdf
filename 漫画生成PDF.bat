chcp 65001

@echo off

for /d %%i in (*) do (
    cd %%i
    magick convert "*.{jpg}" %~dp0\%%i.pdf
    cd..
)

pause