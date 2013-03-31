__cuddles_completion ()
{
  local cur prev
  # Pointer to current completion word.
  # By convention, it's named "cur" but this isn't strictly necessary.
  CUDDLES_DIR=$HOME/cuddles
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
      local full_module_paths=( ~/cuddles/${cur}*/init.sh )

      for x in ${full_module_paths[@]}; do 
        # get rid of the path leading to our cuddles location
        local this_path=${x/$CUDDLES_DIR\/}

        # and trim off the init.sh
        local this_path=${this_path/\/init.sh}
        
        COMPREPLY+=( $this_path )
      done
      # since we're looking for dirs with init.sh in it,
      # we can either use the -o of dirnames or filenames on complete
      # if we use dirnames then the auto completion adds a space to the end of
      # our arg since it finds a dir match in our full_module_paths glob.
      # Here we force the file path to not complete further
      if [[ ${#full_module_paths[@]} -eq 1 ]]; then {
          COMPREPLY=( $this_path ) 
      }
      fi
      shopt -u extglob nullglob
    ;;
  esac

  return 0
}

complete -o filenames -F __cuddles_completion cuddles
