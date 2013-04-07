__cuddles_completion ()
{
  local cur prev
  # Pointer to current completion word.
  # By convention, it's named "cur" but this isn't strictly necessary.
  
  CUDDLES_DIR="$HOME/.cuddles"
  COMPREPLY=()   # Array variable storing the possible completions.
  
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}
  
  shopt -s extglob nullglob
  
  case "$prev" in
    cuddles)
      COMPREPLY=( $( compgen -W 'load' -- $cur ) )
      return 0      
    ;;
    load)
      # glob to grab everything with an init.sh
      COMPREPLY=( $CUDDLES_DIR/${cur}*/init.sh )
      # Trim the ~/.cuddles that prepends the path
      COMPREPLY=("${COMPREPLY[@]#"$CUDDLES_DIR"/}")
      # and then get rid of the init.sh to leave just a module name
      COMPREPLY=("${COMPREPLY[@]%/init.sh}")      
    ;;
  esac
  
  shopt -u extglob nullglob
  return 0
}

complete -o filenames -F __cuddles_completion cuddles
