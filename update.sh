echo "===开始更新博客模板==="
echo "===执行git pull==="
git pull
echo "===执行git add .==="
git add .
time=$(date "+%Y%m%d-%H%M%S")
echo "===执行git commit -m ${time}==="
git commit -m"${time}"
echo "===执行git push==="
git push origin
git push home
echo "===更新结束博客模板==="
echo "===开始更新博客内容==="
echo "===执行hugo命令生成博客静态文件==="
hugo
echo "===进入public目录执行博客内容更新==="
cd public
echo "===执行git pull==="
git pull
echo "===执行git add .==="
git add .
time=$(date "+%Y%m%d-%H%M%S")
echo "===执行git commit -m ${time}==="
git commit -m"${time}"
echo "===执行git push==="
git push
echo "===退出public目录==="
cd ..
echo "===更新完毕==="