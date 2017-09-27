echo "test"
echo $project
echo "tester"
window_root "~/dev/$project"
new_window "$project"
run_cmd "vim package.json"
split_v 20
select_pane 2
run_cmd "git pull"
split_h 50
select_pane 3
run_cmd "npm start $port"
