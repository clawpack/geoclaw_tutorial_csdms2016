# geoclaw_tutorial_csdms2016

Files for a tutorial at the [CSDMS Annual meeting](http://csdms.colorado.edu/wiki/MeetingOfInterest:Meeting-179), May 19, 2016.

## Using SageMathCloud for the tutorial

Tutorial participants are encouraged to create a free account on [SageMathCloud](https://cloud.sagemath.com/) 
so that a project can be shared with you that has GeoClaw pre-installed.  You will then be able to open this
project from any web browser.  Each SageMathCloud (SMC) project is a virtual machine and SMC provides a variety of
tools to interact with the project, including bash shells and Jupyter notebooks.  You will be able to run the
code in single-thread mode and view results with a free account.  If you want better performance, or to use the 
OpenMP parallelization of GeoClaw, or if you want to be able to transfer data or results in to our out of the project,
you can upgrade to a [paid account](https://cloud.sagemath.com/policies/pricing.html).

## Installing Clawpack to use GeoClaw on your own computer

If you prefer to install GeoClaw on your own laptop, you can follow the 
[Clawpack installation instructions](http://www.clawpack.org/installing.html).
See in particular the [Installation Prerequisites](http://www.clawpack.org/installing.html#installation-prerequisites).
You will need a Fortran compiler and the scientific Python stack (Numpy and Matplotlib in particular).  The
[Anaconda Python distribution](https://docs.continuum.io/anaconda/index) is recommended.  Note that you need
Python 2.7 or later (but not Python 3.x).

Note that for GeoClaw you do not need to install PyClaw, so here are some simplified GeoClaw instructions:

Download the tarfile clawpack-5.3.1.tar.gz from
  https://github.com/clawpack/clawpack/releases/

Then unpack and set some environment variables:

    tar -xzf clawpack-5.3.1.tar.gz   # creates clawpack-5.3.1 directory

    export CLAW=/full/path/to/clawpack-5.3.1   # adjust the path
    export PYTHONPATH=$CLAW:$PYTHONPATH
    export FC=gfortran   # or other preferred Fortran compiler

You might want to put the export commands in your `.bashrc` file or whatever file is executed each time
you open a new shell, since these must always be set when running GeoClaw or visualizing results with VisClaw.

Then you can finish the installation by creating some symbolic links needed so that Python modules
will be properly imported:

    cd $CLAW   # assuming this environment variable was properly set
    python setup.py symlink-only

Then you should be able to do:

    cd $CLAW/geoclaw/examples/tsunami/chile2010
    make all

For more information, see the [GeoClaw documentation](http://www.clawpack.org/contents.html#geoclaw-geophysical-flows).

