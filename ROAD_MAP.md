# [Habitat][readme-md] 
####Road Map

- Add functionality to easily add/tear down aliases


####SPEC
installation: curl copy/paster to add to bashrc



habitat load module_dir #source init.sh
habitat load particular/script/snippet.sh #sources a script in your habitat dir, adds a breadcrumb and all
habitat undo
habitat nuke #wipe your environment

preserve new NAME #saves current crumbtrail as NAME
preserve load NAME #loads crumbtrail
preserve list
preserve default [--reset|NAME] #sets a habitat as default


#pathing
is_in_var [--partial --delineator ":"] VAR_NAME value
append_to_var [--undo] VAR_NAME value
prepend_to_var [--undo] VAR_NAME value
remove_from_var [--undo] VAR_NAME value
set_var [--undo] VAR_NAME value
clear_var VAR_NAME value



#LOADING
load_module


#Testing
We pretty much need to test everything. Always O_o