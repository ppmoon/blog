echo "===开始更新博客==="
echo "===执行git pull==="
git pull
echo "===执行git add .==="
git add .
echo "===执行git commit -m\"date +%Y%m%d%H%M%S \"==="
git commit -m"date +%Y%m%d%H%M%S"
echo "===执行git push==="
git push
echo "===更新结束博客==="