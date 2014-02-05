# ~/.bash_profile
# Set the OS X Terminal default profile to "Pro" and check the "Anitalias text" checkbox.
export LANG=no_NO.UTF-8                 # Norwegian Viking
export LC_ALL=$LANG
export ARCHFLAGS="-arch x86_64"         # 64-bit architecture
export HISTSIZE=10000                   # The number of shell command events saved in the history list ~/.bash_history
export HISTCONTROL=ignoreboth           # Don’t save duplicates
export HISTIGNORE=ls:ps:pwd:clear       # Neither "ls", "ps", "pwd", or "clear" will appear in history
export PYTHONSTARTUP=~/.pythonstartup   # Python startup script


# Terminal colors
NM="\[\033[0;38m\]"  # No background and white lines
HI="\[\033[0;35m\]"  # Letter colors
SI="\[\033[0;33m\]"  # Current directory
IN="\[\033[0m\]"     # Texten man skriver
export PS1="$NM$HI\u $SI\w$NM: $IN"       # BASH prompt
export CLICOLOR=1                         # Simply enable coloring of terminal
export LSCOLORS="exfxcxdxbxegedabagacad"  # Specifies how to color specific items
export LS_OPTIONS="--color=auto"          # Enables color output and displaying in the long format by default.


# A couple of handy shell aliases 
# -------------------------------
# Get current date and time
alias now="date +'%m.%B %T'"
# Get external IP
alias myip="curl -a -s http://my-ipaddress.appspot.com/ | pbcopy && pbpaste; echo; echo 'Pasted to clipboard'"
# Count the number of files and folders in current working directory
alias count_files="ls -1 | wc -l | sed s/[^0-9]//g"
# Display a tree-like structural view of current working directory
alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^\/]*\//|  /g' -e 's/|  \([^|]\)/\`--\1/g'"
# List all hidden files and folders in the current working directory
alias lsdot="ls -AdF .[a-zA-Z0-9]*"
# Display the total size of the current working directory including all the subdirectories
alias .="du -sh"
# Lock the computer
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
# Lines of code per user on Git
alias git-users="git ls-files -z | xargs -0n1 git blame -w | ruby -n -e '\$_ =~ /^.*\((.*?)\s[\d]{4}/; puts \$1.strip' | sort -f | uniq -c | sort -n"
# Get HTTP status of given URL
alias http_status="curl -sL -w '%{http_code}\n' '$0' -o /dev/null"

# http://php-osx.liip.ch/
export PATH=/usr/local/php5/bin:$PATH
