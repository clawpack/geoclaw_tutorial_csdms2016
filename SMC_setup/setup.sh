
# These commands should only be run once the first
# time you use this project.
#
# This will change the file $HOME/.bashrc by adding some
# export statements at end to set enviornment variables.
# Then any new terminal you open will have these variables set.

cat $HOME/SMC_setup/set_environment_variables >> $HOME/.bashrc
source $HOME/SMC_setup/set_environment_variables
cd $CLAW
python setup.py symlink-only

