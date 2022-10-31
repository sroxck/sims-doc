#!/usr/bin/env sh

# 确保脚本抛出遇到的错误
set -e

# 生成静态文件
npm run build

# 进入生成的文件夹
cd docs/.vuepress/dist

# deploy to github pages
echo 'yalibook.com' > CNAME


git init
git add -A
git commit -m "deploy"
git push -f git@github.com:sroxck/sroxck.github.io.git master:gh-pages  # 推送到github gh-pages分支
git push -f https://github.com/sroxck/sroxck.github.io.git master:gh-pages  # 推送到github gh-pages分支
https://github.com/sroxck/sroxck.github.io.git
cd -
rm -rf docs/.vuepress/dist
