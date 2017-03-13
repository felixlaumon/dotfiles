window_root "~"
new_window "monitor"

split_h 35

select_pane 2
split_v 50

select_pane 1
run_cmd "glances -b -t 5"
select_pane 2
run_cmd "watch_gpu_util"
select_pane 3
run_cmd "watch_gpu"

select_pane 1
