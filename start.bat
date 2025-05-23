@echo off

REM Attempt to activate Anaconda environment
call C:\Users\DELL\anaconda3\Scripts\activate.bat base

pushd backend

REM Upgrade pip and setuptools using the activated environment's Python
call python -m pip install --upgrade pip setuptools

REM Install dependencies using the activated environment's Python
call python -m pip install pydantic fastapi gdown py7zr

REM Set Uvicorn port
SET UVICORN_PORT=8000
ECHO Starting server...

REM Start browser
call start http://localhost:%UVICORN_PORT%

REM Start Uvicorn using the activated environment's Python
call python -m uvicorn main:app --reload --port %UVICORN_PORT%

popd