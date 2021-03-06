# spaceship configuration
SPACESHIP_PROMPT_ORDER=(
  user      # Username section
  host      # Hostname section
  dir       # Current directory section
  git       # Git section (git_branch + git_status)
  venv      # Python virtualenv section
  aws       # Amazon Web Services section
  terraform # Terraform workspace section
  # line_sep  # Line separator
  exit_code # Exit code section
  char      # Prompt character
)

#SPACESHIP_RPROMPT_ORDER=(
#)

SPACESHIP_CHAR_SUFFIX=" "
SPACESHIP_CHAR_SYMBOL="▶"

SPACESHIP_DIR_COLOR="blue"
SPACESHIP_DIR_PREFIX=""
SPACESHIP_DIR_SUFFIX=" "

SPACESHIP_GIT_BRANCH_COLOR="cyan"
SPACESHIP_GIT_BRANCH_PREFIX=""
SPACESHIP_GIT_PREFIX="("
SPACESHIP_GIT_STATUS_COLOR="gray"
SPACESHIP_GIT_SUFFIX=") "

SPACESHIP_HOST_COLOR="red"
SPACESHIP_HOST_PREFIX="@"
SPACESHIP_HOST_SHOW="true"

SPACESHIP_PROMPT_ADD_NEWLINE=false
SPACESHIP_PROMPT_FIRST_PREFIX_SHOW=false
SPACESHIP_PROMPT_SEPARATE_LINE=false

SPACESHIP_USER_COLOR="blue"
SPACESHIP_USER_PREFIX=""
SPACESHIP_USER_SHOW="true"
SPACESHIP_USER_SUFFIX=""
