function open-pull-request () {
    merge_commit=$(ruby -e 'print (File.readlines(ARGV[0]) & File.readlines(ARGV[1])).last' <(git rev-list --ancestry-path $1..release) <(git rev-list --first-parent $1..release))
    if git show $merge_commit | grep -q 'pull request'
    then
        pull_request_number=$(git log -1 --format=%B $merge_commit | sed -e 's/^.*#\([0-9]*\).*$/\1/' | head -1)
        url="https://github.com/moneyforward/ca_web/pull/${pull_request_number}"
    fi
    open $url
}
