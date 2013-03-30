__cuddles_completion ()
{
  local cur prev
  # Pointer to current completion word.
  # By convention, it's named "cur" but this isn't strictly necessary.
  CUDDLES_DIR=$HOME/cuddles
  COMPREPLY=()   # Array variable storing the possible completions.
  cur=${COMP_WORDS[COMP_CWORD]}
  prev=${COMP_WORDS[COMP_CWORD-1]}

  case "$prev" in
    load)
      local full_module_paths=( ~/cuddles/$cur*/init.sh )
      for x in ${full_module_paths[@]}; do 
        # get rid of the path leading to our cuddles location
        local this_path=${x/$CUDDLES_DIR\/}

        # and trim off the init.sh
        local this_path=${this_path/\/init.sh}
        
        COMPREPLY+=( $this_path )
      done
      return 0
    ;;
  esac
  COMPREPLY=( $( compgen -W 'load' -- $cur ) )
  return 0
}

complete -F __cuddles_completion cuddles
