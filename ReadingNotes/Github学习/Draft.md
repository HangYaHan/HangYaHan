git merge
主干王分支提交一般不提交PR

常用的三个命令
merge
squash and merge （merge --squash）
rebase
---> squash挤压，把之前的commit的“挤压”到一个commit中，使得commit链路干净
---> rebase变基，把HEAD变基到了main分支后面（这个必须使用强制推送，因而在多人协作中使用非常危险）

insights菜单中查看network选项可以查看分支合并情况
cherry-pick：选择部分commit以进行合并

分支合并冲突：同一文件同一行的合并 => conflict => resolve conflict
先创建合并，在提示合并之后，把文件/文件名手动改变成想要的想要的形式（act as a arbitrary）