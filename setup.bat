@echo off
echo ============================================================
echo   MIDAS GDP Forecasting Project - Setup
echo   Andreou, Ghysels, Kourtellos (2013) Replication
echo ============================================================
echo.

REM Check if Python is installed
python --version >nul 2>&1
if errorlevel 1 (
    echo [ERROR] Python is not installed or not in PATH
    echo Please install Python 3.9+ from https://www.python.org/downloads/
    pause
    exit /b 1
)

echo [1/4] Creating virtual environment...
if exist .venv (
    echo      Virtual environment already exists, skipping creation.
) else (
    python -m venv .venv
    if errorlevel 1 (
        echo [ERROR] Failed to create virtual environment
        pause
        exit /b 1
    )
    echo      Done!
)

echo.
echo [2/4] Activating virtual environment...
call .venv\Scripts\activate.bat
if errorlevel 1 (
    echo [ERROR] Failed to activate virtual environment
    pause
    exit /b 1
)
echo      Done!

echo.
echo [3/4] Upgrading pip...
python -m pip install --upgrade pip --quiet
echo      Done!

echo.
echo [4/4] Installing dependencies...
pip install -r requirements.txt --quiet
if errorlevel 1 (
    echo [ERROR] Failed to install dependencies
    pause
    exit /b 1
)
echo      Done!

echo.
echo ============================================================
echo   Setup Complete!
echo ============================================================
echo.
echo To activate the environment manually, run:
echo     .venv\Scripts\activate
echo.
echo To run Jupyter Notebook:
echo     jupyter notebook main.ipynb
echo.
echo Or open the project in VS Code and select the .venv interpreter.
echo ============================================================
pause
