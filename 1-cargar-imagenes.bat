@echo off
cd /d "%~dp0"
docker info >nul 2>&1
if errorlevel 1 (
  echo [ERROR] Docker Desktop no esta en ejecucion. Abralo, espere a que diga "Engine running" y vuelva a intentar.
  pause
  exit /b 1
)
echo Cargando las imagenes pokedex-api, pokedex-web, postgres y adminer (puede tardar un minuto)...
docker load -i pokedex-imagenes.tar.gz
if errorlevel 1 (
  echo [ERROR] No se pudieron cargar las imagenes.
  pause
  exit /b 1
)
docker images --filter "reference=pokedex-*"
docker images --filter "reference=postgres:16-alpine"
docker images --filter "reference=adminer:4.8.1"
echo.
echo Imagenes cargadas. Ahora ejecute 2-iniciar.bat
pause
