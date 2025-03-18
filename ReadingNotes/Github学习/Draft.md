## git diff
查看比较两个分支/commit/tag/区之间的不同，我的理解是这些东西本质上都是指针，指向快照的指针，因此当然可以互通的比较。

--staged 比较当前区和暂存区的区别

git switch 和 git checkout都可以用来切换分支
checkout是早期的命令，除了切换分支还有别的功能（比如说，有哪些功能），而switch是一个专注于切换分支的命令。

git diff XXX..YYY 和 git diff XXX...YYY 的区别
三个点的比较是寻找X和Y的共同祖先，用x和祖先进行比较（我不确定），两点比较是直接比较X和Y

## git stash
git stash 暂存当前的修改
git stash list查看所有的stash

取出Stash有两种方式，pop（取出并删除当前修改） && apply（取出并不删除当前修改）

stash drop 'id' 可以

## git tag
git tag v1.0.0 当前位置加tag

git tag v1.0.0  'id'在commit id处添加tag

git push --tag 
git tag -d删除tag

tag ~ 分支 ~ commit本质上是一样的

对于想合并若干次commit，可以用mixed的方式reset到想要squash的最初的节点，然后再提交
或者使用rebase -i来进行交互式操作，处理commit

## 关于github的大文件系统LFS
对于单个文件的>50mbGitHub会发出警告, >100mbGitHub不允许进行托管
LFS是github的大文件存储系统，由于每次commit都会提交一个大文件的快照，如果不加以改变，那么很快.git文件就会变得很大。因此github专门开辟了一个空间来存储所有大文件的历史版本。

git lfs install
git lfs track "*.mp4" 意为保存所有MP4文件，lfs免费的存储空间只有1GB
并不是很常用的一个功能

## Action
GitHub action 是GitHub的自动化流水线功能
CI/CD: continuous intergration/ continuous delivery event 触发器
action市场提供了开发者的多样的开源action，避免了代码复用。