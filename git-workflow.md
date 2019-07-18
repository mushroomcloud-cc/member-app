# Github 流程说明

## Fork

- fork 项目,  访问 https://github.com/mushroomcloud-cc/member-app ，点击 fork 按钮，将项目 fork 到自己的账户下，得到新的地址, 如: https://github.com/Liangdi/member-app
- clone 新的项目：git clone git@github.com:Liangdi/member-app.git

## Commit

- 开发完成新代码
- git commit 提交你的修改
- git push origin master 推送代码到服务器

## Pull Request

- 访问自己账户下的项目
- 创建 pull request

## Merge Pull Reqeust

- 等待上游 merge pull request

## Syncing a fork

- 添加上游仓库  git remote add upstream git@github.com:mushroomcloud-cc/member-app.git
- 同步上游代码  git fetch upstream
- 使用 git merge 合并本地代码  git merge upstream/master

## git tips:
- 使用 git origin -v 查看 远程服务器的信息
- git branch -a  查看分支信息
- git status 查看你的修改的内容
- git checkout -- <文件名>  撤销修改 (git checkout 功能之一)
- git diff 查看修改的详情
- git log --oneline 查看修改日志
- 修改 remote ，删除-> 添加
- git remote remove origin
- git remote add origin git@github.com:mushroomcloud-cc/member-app.git