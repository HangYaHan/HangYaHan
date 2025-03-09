## git 命令行操作
更原始，更纯粹的操作方式
git --version 查看是否已经安装了git

git clone <链接>

*git status*：查询当前状态，非常有用，可以查看当前HEAD指针

git commit (-m, -am, 介绍作用)

git push

git add (.加全部)

git restore （从暂存区取出）

git pull （在大部分情况下都建议用rebase）
每个人都使用一个分支
pull = fetch + merge

git log 查看提交日志

git config 修改设置

git rm 以后不要再管某个文件了

git mv移动文件，也可以用于重命名，其实文件夹目录本质上是不同的名字，只是显式的展示这样的hierarchy而已

git reset重置状态

git show显示详细信息

git revert撤销

git amend 修改上一次commit（先add 然后在commit）

ESC + wq！退出vim

4种后悔药：discard，revert，amend，reset
amend一般用于修补，revert相对安全

关于branch

git branch (-a)
git checkout (-b)创建分支
拉取、删除、远程推送分支
不能删当前分支然后再切换别的分支

fast forward
此时merge不会用新的线拉出来，在没有分叉的情况下，建立分支

non fast forward
no fast forward 不要快速前进而是拉线 --no --ff

git log xxx..yyy有顺序，是比
git log xxx...yyy无顺序，相当于xxx..yyy加上yyy..xxx

git diff

git cherry-pick committID