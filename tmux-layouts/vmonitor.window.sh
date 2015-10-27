window_root "~"
new_window "monitor"

split_v 50
select_pane 1
split_v 50
select_pane 3
split_v 50

select_pane 1
run_cmd "glances -t 5 --percpu"
select_pane 2
run_cmd "watch -n 5 sensors"
select_pane 3
run_cmd "watch -n 0.5 nvidia-smi"

select_pane 1
