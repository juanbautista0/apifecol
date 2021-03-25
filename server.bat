rem check if arg is file or dir
if exist "%~1\" (
  php -S localhost:8888 -t "%~1"
) else (
  php -S localhost:8888 -t "%~dp1"
)