# ~/.bash_profile
export LANG=no_NO.UTF-8             # Norwegian Viking.
export LC_ALL=$LANG                 # Set the locales to correspond with "$LANG".
export ARCHFLAGS="-arch x86_64"     # 64-bit architecture.
export HISTSIZE=10000               # The number of shell command events saved in the history list ~/.bash_history.
export HISTCONTROL=ignoreboth       # Don’t save duplicates.
export HISTIGNORE=ls:ps:pwd:clear   # Neither "ls", "ps", "pwd", or "clear" will appear in history.


# Determine any active Python virtualenv details.
function set_virtualenv () {
  if test -z "$VIRTUAL_ENV" ; then
    PYTHON_VIRTUALENV=""
  else
    TXTCYN='\e[0;37m'
    PYTHON_VIRTUALENV="${TXTCYN}(`basename \"$VIRTUAL_ENV\"`)${COLOR_NONE}"
  fi
}
# Assemble the Git parsing art of the prompt.
git_prompt () {
  if ! git rev-parse --git-dir > /dev/null 2>&1; then
    return 0
  fi
  git_branch=$(git branch 2>/dev/null | sed -n '/^\*/s/^\* //p')
  if git diff --quiet 2>/dev/null >&2; then
    git_color=`tput setaf 2`
  else
    git_color=`tput setaf 1`
  fi
  echo "($git_color$git_branch`tput sgr0`)"
}
function parse_git_dirty() {
  [[ $(git status 2> /dev/null | tail -n1) != *"working directory clean"* ]] && echo "*"
}
function parse_git_branch() {
  git branch --no-color 2> /dev/null | sed -e '/^[^*]/d' -e "s/* \(.*\)/\1$(parse_git_dirty)/"
}
function set_git_branch {
  BRANCH=`parse_git_branch`
}
function is_git_repository {
  git branch > /dev/null 2>&1
}
function set_bash_prompt () {
  # Set the PYTHON_VIRTUALENV variable.
  set_virtualenv
  # Set the BRANCH variable.
  if is_git_repository ; then
    set_git_branch
  else
    BRANCH=''
  fi
  # Set the bash prompt variable.
  PS1="${PYTHON_VIRTUALENV}$NM$HI\u $SI\w$NM$(git_prompt): $IN"
}

# Terminal colors
# ---------------
NM="\[\033[0;38m\]"  # No background and white lines.
HI="\[\033[0;35m\]"  # Letter colors.
SI="\[\033[0;33m\]"  # Current directory.
IN="\[\033[0m\]"     # Texten man skriver.
export PROMPT_COMMAND=set_bash_prompt     # The holy BASH promt.
export CLICOLOR=1                         # Simply enables coloring of the terminal.
export LSCOLORS="exfxcxdxbxegedabagacad"  # Specifies how to color specific items.
export LS_OPTIONS="--color=auto"          # Enables color output and displaying in the long format by default.
export GREP_OPTIONS='--color=auto -n'     # Colorize and display the line number of the matched string.


# A couple of handy shell aliases
# -------------------------------
# Get current date and time.
alias now="date +'%m.%B %T'"
# Get external IP.
alias myip="curl -a -s http://my-ipaddress.appspot.com/ | pbcopy && pbpaste; echo; echo 'Pasted to clipboard'"
# Count the number of files and folders in current working directory.
alias count_files="ls -1 | wc -l | sed s/[^0-9]//g"
# Display a tree-like structural view of current working directory.
alias tree="ls -R | grep ':$' | sed -e 's/:$//' -e 's/[^\/]*\//|  /g' -e 's/|  \([^|]\)/\`--\1/g'"
# List all hidden files and folders in the current working directory.
alias lsdot="ls -AdF .[a-zA-Z0-9]*"
# Display the total size of the current working directory including all the subdirectories.
alias .="du -sh"
# Lock the computer.
alias lock='/System/Library/CoreServices/"Menu Extras"/User.menu/Contents/Resources/CGSession -suspend'
# Lines of code per user on Git.
alias git-users="git ls-files -z | xargs -0n1 git blame -w | ruby -n -e '\$_ =~ /^.*\((.*?)\s[\d]{4}/; puts \$1.strip' | sort -f | uniq -c | sort -n"
# Get HTTP status of given URL.
alias http_status="curl -sL -w '%{http_code}\n' '$0' -o /dev/null"
# Pretty-print JSON - $ cat foo.json | ppjson.
alias ppjson="python -m json.tool"
# Create Python 3 virtual environment.
alias py3env="virtualenv --python=/usr/local/bin/python3"
# Get the mx record(s) for domain.
alias mx="host -t mx"
# Get name server(s) of domain.
function get_ns() { dig +short NS $1 | rev | cut -c 2- | rev; }
# Get the absolute path to given file.
function ap() { pushd . > /dev/null; if [ -d "$1" ]; then cd "$1"; dirs -l +0; else cd "`dirname \"$1\"`"; cur_dir=`dirs -l +0`; if [ "$cur_dir" == "/" ]; then echo "$cur_dir`basename \"$1\"`"; else echo "$cur_dir/`basename \"$1\"`"; fi; fi; popd > /dev/null; }
# Build and update the locate database.
alias updatedb="sudo /usr/libexec/locate.updatedb"

