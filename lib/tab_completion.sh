__habitat_completion ()
{
  local cur prev
  # Pointer to current completion word.
  # By convention, it's named "cur" but this isn't strictly necessary.
  
  HABITAT_DIR="$HOME/.habitat"
  COMPREPLY=()   # Array variable storing the possible completions.
  
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  
  shopt -s extglob nullglob
  
  case "$prev" in
    habitat)
      COMPREPLY=( $( compgen -W 'load' -- $cur ) )
      return 0      
    ;;
    load)
      # glob to grab everything with an init.sh
      COMPREPLY=( $HABITAT_DIR/${cur}*/init.sh )
      # Trim the ~/.habitat that prepends the path
      COMPREPLY=("${COMPREPLY[@]#"$habitat_DIR"/}")
      # and then get rid of the init.sh to leave just a module name
      COMPREPLY=("${COMPREPLY[@]%/init.sh}")      
    ;;
  esac
  
  shopt -u extglob nullglob
  return 0
}

complete -o filenames -F __habitat_completion habitat
