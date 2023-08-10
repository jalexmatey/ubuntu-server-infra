#!/usr/bin/env bash
#  _                _                
# | |              | |               
# | |__   __ _  ___| | ___   _ _ __  
# | '_ \ / _` |/ __| |/ / | | | '_ \ 
# | |_) | (_| | (__|   <| |_| | |_) |
# |_.__/ \__,_|\___|_|\_\\__,_| .__/ 
#                             | |    
#                             |_| 
#
# A simple script to backup sonarr and radarr data.
#
# Usage:
#   arr_backup.sh <options>...
#
# Depends on:
#  gdrive
#
# Copyright (c) 2023 Jack Alexander • info@jalexmatey.co.uk

# Treat unset variables and parameters other than the special parameters ‘@’ or
# ‘*’ as an error when performing parameter expansion. An 'unbound variable'
# error message will be written to the standard error, and a non-interactive
# shell will exit.
set -o nounset

# Exit immediately if a pipeline returns non-zero.
set -o errexit

# Print a helpful message if a pipeline with non-zero exit code causes the
# script to exit as described above.
trap 'echo "Aborting due to errexit on line $LINENO. Exit code: $?" >&2' ERR

# Allow the above trap be inherited by all functions in the script.
#
# Short form: set -E
set -o errtrace

# Return value of a pipeline is the value of the last (rightmost) command to
# exit with a non-zero status, or zero if all commands in the pipeline exit
# successfully.
set -o pipefail

# Set $IFS to only newline and tab.
#
# http://www.dwheeler.com/essays/filenames-in-shell.html
IFS=$'\n\t'

###############################################################################
# Environment
###############################################################################

# $_ME
#
# This program's basename.
_ME="$(basename "${0}")"

# $_RADARR_PATH
#
# Path to Radarr directory.
_RADARR_PATH="/home/jalex/radarr-data"

# $_SONARR_PATH
#
# Path to Radarr directory.
_SONARR_PATH="/home/jalex/sonarr-data"

# $_BACKUP_FILE
#
# Path to backup file.
_BACKUP_FILE="/home/jalex/arr_backup.tar.gz"

# $_GDRIVE_FILE_ID
#
# The file ID of the file on GDRIVE
_GDRIVE_FILE_ID=""

###############################################################################
# Help
###############################################################################

# _print_help()
#
# Usage:
#   _print_help
#
# Print the program help information.
_print_help() {
  cat <<HEREDOC

Boilerplate for creating a simple bash script with some basic strictness
checks and help features.

Usage:
  ${_ME} [<arguments>]
  ${_ME} -h | --help

Options:
  -h --help  Show this screen.
HEREDOC
}

###############################################################################
# Main
###############################################################################

# _main()
#
# Usage:
#   _main [<options>] [<arguments>]
#
# Description:
#   Entry point for the program, handling basic option parsing and dispatching.
_main() {
  # Avoid complex option parsing when only one program option is expected.
  if [[ "${1:-}" =~ ^-h|--help$  ]]
  then
    _print_help
  fi

  # Back up sonarr and radarr data.
  tar -czf "${_BACKUP_FILE}" "${_SONARR_PATH}" "${_RADARR_PATH}"

  # Upload the tar file to google drive
  gdrive files update "${_GDRIVE_FILE_ID}" "${_BACKUP_FILE}"
}

# Call `_main` after everything has been defined.
_main "$@"
