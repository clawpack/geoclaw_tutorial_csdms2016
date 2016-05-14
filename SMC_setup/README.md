# Setup procedure on SageMathCloud

This directory contains files needed only for setting things up on SageMathCloud

Assumes the directory clawpack-5.3.1 exists.

Contents:

 - setup.sh - commands that should be executed only once to set things up
 - set_environment_variables - these lines will be appended to $HOME/.bashrc during setup.


## Instructions

Participants in the CSDMS clinic should first create an account on SMC and
send us the email address you used to create it.  (You should have received
email about this from CSDMS.)

Then sometime before the clinic starts you should find a project named
`geoclaw_tutorial_csdms2016` appear in your SMC list of projects.

## Initial setup of your project:

Open this project and you should see several subdirectories, in particular
 - `clawpack-5.3.1` 
 - `SMC_setup`
 - `myclaw`

Do the following to set things up the first time you use the project:

1. Create a terminal by clicking on `New` and then `terminal`.

2. In the terminal:

    bash $HOME/SMC_setup/setup.sh  # only do this once

After this, any time you start a new terminal even after the project has
been closed and reopened, all the environment variables should be set
properly.

## Other SMC hints:

- You can open a file for editing by navigating to it in the `Files` tab and
  clicking on it, or by typing e.g.:

    open setrun.py

  in a terminal window.

## Next steps:

- See chile2010/Example1.md

