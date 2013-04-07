# habitat
###Making a home from a shell.
The habitat project is designed as a simple and easy way to manage bashrc, bash_profile or any other collection of bash scripts that are normally taken as a profile of sorts... Work, debug, webdev etc.

## Install
*snippet*

## Usage
To load a module in terminal or in a bashrc/other bash script, simple run:
habitat load module_name

## Modules?
Cuddles operates off of the assumption that you want to organize your scripts logically in directories (or as standalone files) instead of smashing them all in one file as bashrc was designed.

Additionally, we assume that you'll accumulate snippets over the years that you don't necessarily want in your working profile but want to keep organized none the less.

If you have a collection of scripts, you can source a whole directory of them. To do this, place an init.sh script in the directory root that sources the desired components.
from there you can run the same:
cuddles load module_name

Because of this, you can source a bash file saved in your cuddles dir like:
habitat load module_name

##Why is this different than source script_name? 
Like in real life, doing something to your habitat leaves some sort of footprint. We track your changes and expose easy to use tools to undo or save this functionality.


##Actions
#####habitat
- load		:: loads a habitat module or any bash file
- undo		:: pop the last change from the environment

## Implementation
Pure BASH!

