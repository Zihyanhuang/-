@echo off
chcp 65001 >nul
title 日照中心 凱比長者認知數位化管理系統

echo =======================================================
echo    日照中心 凱比機器人長者認知分數數位化系統
echo =======================================================
echo.
echo 正在檢查執行環境...

where python >nul 2>nul
if %errorlevel% equ 0 (
    echo [OK] 偵測到 Python 環境，正在啟動本地 SQLite 伺服器 (Port 8000)...
    start /B python backend/server.py
    timeout /t 2 >nul
    echo.
    echo 正在為您開啟「日照智能時序跑關」、「照護管理後台」與「凱比長者互動端」...
    start http://localhost:8000/daycare_flow/index.html
    start http://localhost:8000/dashboard/index.html
    start http://localhost:8000/kebbi_app/index.html
) else (
    echo [提示] 未偵測到 Python，系統將自動以「瀏覽器離線資料模式」啟動！
    echo (本系統具備離線自動存檔功能，所有評估紀錄皆安全儲存於本機)
    echo.
    start "" "daycare_flow\index.html"
    start "" "dashboard\index.html"
    start "" "kebbi_app\index.html"
)

echo.
echo =======================================================
echo  系統已成功在瀏覽器開啟！
echo  - ⏱️ 日照作息與智能鬧鐘: daycare_flow/index.html
echo  - 📊 照服員管理儀表板: dashboard/index.html
echo  - 🤖 凱比長者動腦互動: kebbi_app/index.html
echo =======================================================
echo.
pause
