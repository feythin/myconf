### tmux相关操作

创建session
tmux new -s session_name
列出所有session列表
tmux ls
进入session
tmux a -t session_name
tmux a 进入最后一个session
删除session
tmux kill-session -t session_name


