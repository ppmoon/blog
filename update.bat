@echo off
echo ===开始更新博客模板===
echo ===执行git pull===
git pull
echo ===执行git add .===
git add .

REM 获取当前日期时间戳：格式为 yyyyMMdd-HHmmss
for /f "tokens=*" %%i in ('powershell -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set timestamp=%%i
echo ===执行git commit -m %timestamp%===
git commit -m"%timestamp%"
echo ===执行git push===
git push origin
git push home
echo ===更新结束博客模板===

echo ===开始更新博客内容===
echo ===执行hugo命令生成博客静态文件===
hugo
echo ===进入public目录执行博客内容更新===
cd public
echo ===执行git pull===
git pull
echo ===执行git add .===
git add .

for /f "tokens=*" %%i in ('powershell -Command "Get-Date -Format yyyyMMdd-HHmmss"') do set timestamp=%%i
echo ===执行git commit -m %timestamp%===
git commit -m"%timestamp%"
echo ===执行git push===
git push
echo ===退出public目录===
cd ..
echo ===更新完毕===

pause
