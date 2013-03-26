# cuddles
###A friendlier way to BASH.
The cuddles project is designed as a simple and easy way to manage bashrc, bash_profile or any other collection of bash scripts that are normally taken as a profile of sorts... Work, debug, webdev etc.

## Install
To simplify things, you can source the cuddles file and run:
cuddles install

## Usage
To load a module in terminal or in a bashrc/other bash script, simple run:
cuddles load module_name

## Modules?
Cuddles operates off of the assumption that you want to organize your scripts logically in directories (or as standalone files) instead of smashing them all in one file as bashrc was designed.

Additionally, we assume that you'll accumulate snippets over the years that you don't necessarily want in your working profile but want to keep organized none the less.

Because of this, you can source a bash file saved in your cuddles dir like:
cuddles load module_name

Optionally, if you have a collection of scripts, you can source a whole directory of them. To do this, place an init.sh script in the directory root that sources the desired components.
from there you can run the same:
cuddles load module_name


##Actions
- load		:: loads a cuddles module or any bash file
- install   :: sets cuddles to manage your bashrc, bash_profile, bash_logon and bash_logout
- 

## Implementation
Pure BASH!

