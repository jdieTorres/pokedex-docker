@echo off
cd /d "%~dp0"
docker info >nul 2>&1
if errorlevel 1 (
  echo [ERROR] Docker Desktop no esta en ejecucion. Abralo, espere a que diga "Engine running" y vuelva a intentar.
  pause
  exit /b 1
)
echo Deteniendo y eliminando los contenedores (los datos se conservan en el volumen pokedex_pg_data)...
docker compose down
docker volume ls --filter name=pokedex
pause
