alias gs='git status -sb'
alias co='_(){echo "Use git switch (sw)"; return 42;};_'
alias sw='git switch'
alias unpushed='git log @{upstream}..'
alias unpulled='git fetch; git log ..@{upstream}'
alias branch-blame='git for-each-ref --format="%(authorname)" | sort | uniq -c | sort -r'
