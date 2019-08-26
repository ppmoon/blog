echo "===开始更新博客==="
echo "===执行git pull==="
git pull
echo "===执行git add .==="
git add .
time=$(date "+%Y%m%d-%H%M%S")
echo "===执行git commit -m ${time}==="
git commit -m"${time}"
echo "===执行git push==="
git push
echo "===更新结束博客==="