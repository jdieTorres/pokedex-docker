@echo off
cd /d "%~dp0"
docker info >nul 2>&1
if errorlevel 1 (
  echo [ERROR] Docker Desktop no esta en ejecucion. Abralo, espere a que diga "Engine running" y vuelva a intentar.
  pause
  exit /b 1
)
echo Levantando PostgreSQL, API, web y Adminer...
docker compose up -d --wait
if errorlevel 1 (
  echo [ERROR] Algun servicio no arranco. Revise con: docker compose logs
  docker compose ps
  pause
  exit /b 1
)
docker compose ps
echo.
echo PokeDex Team Builder : http://localhost:8090
echo Adminer (tablas)     : http://localhost:8091   Sistema PostgreSQL, servidor db, usuario pokedex, base pokedex
echo (Se necesita internet para consultar PokeAPI y ver las imagenes de los Pokemon)
start "" http://localhost:8090
pause
