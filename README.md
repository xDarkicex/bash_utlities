#Readme Bash utilities

These are a collection of my current bash utilities, they are hosted on github because sharing is caring.

To run these files properly you will need to set up a loop to import the files and alias this should be done within your `.bashrc`

I have installed my utilities in a hidden folder named utilities, you can source them in any location you find convenient.

`shopt -s expand_aliases
for f in ~/.utilities/*.sh; do source $f; done`

You will need to setup an importer in your .bash_profile

`if [ -f ~/.bashrc ]; then
   source ~/.bashrc
fi`

That is all that is required.

##Optional

Optionally you can create a alias to the .utilities location for faster location.

`alias utilities='~/.utilities && ls'`
