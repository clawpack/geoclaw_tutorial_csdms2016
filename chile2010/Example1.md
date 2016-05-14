
# Running the Chile 2010 example 

These instructions will step you through running a sample tsunami simulation.

 1. Make sure Clawpack is installed and your environment variables `CLAW`
    and `PYTHONPATH` are both set to point to the top level directory.

 2. You might want to create a separate directory for storing your own
    GeoClaw experiments, to make it easier to later update to a newer
    version of Clawpack.  In these examples we will assume `MYCLAW` is an
    environment variable you have set to point to this directory.

 3. We will start with the sample tsunami model that is available 
    in the directory `$CLAW/geoclaw/examples/tsunami/chile2010`.
    Start by copying this directory to a new version you can play around
    with:

        cp -r $CLAW/geoclaw/examples/tsunami/chile2010 $MYCLAW/chile2010a
        cd $MYCLAW/chile2010a

4. First take a look at the files in this directory. You can also
   view them online at 
   http://www.clawpack.org/_static/geoclaw/examples/tsunami/chile2010/README.html

   In particular, every Clawpack application directory typically contains:
     - `Makefile`, which specifies what Fortran files must be compiled.
       Various targets are defined in the common file
       `$CLAW/clawutil/src/Makefile.common`
       that is used via an `include` statement in the application `Makefile`.
       See http://www.clawpack.org/makefiles.html
       for description of the various `make` commands commonly used.

     - `setrun.py` specifies the runtime parameters.
       These are used to create files `*.data` that are read in by the
       Fortran code.  See
       http://www.clawpack.org/setrun_geoclaw.html

     - `setplot.py` specifies plotting parameters used when visualizing the
       solution.  See
       http://www.clawpack.org/setplot.html

5. In principle you could type:

        make all

   and everything necessary will be done to compile and run the code and
   produce a set of plots.

   But don't do this.

   Instead we will break this down into steps to understand what goes:

6. First compile the Fortran code:

        make .exe
   
   If you get an error like:

        Makefile:179: /clawutil/src/Makefile.common: No such file or directory

   then your `CLAW` environment variable is not set.

   Otherwise you should see the Fortran code being compile and eventually an
   executable `xgeo` will be produced.

7. Now create the `*.data` files needed by the Fortran code:

        make .data

8. This tsunami model needs topography data and also a data file specifying
   the earthquake source.  These are created via:

        make topo

   Note that topography data will be downloaded from a website unless
   it already exists.  See the file `maketopo.py`, which is executed by this 
   `make topo` command.

9. Now run the code (this will take a few minutes):

        make .output

   This creates a directory `_output` containing output at several times.

10. Finally, create the plots:

        make .plots
   
   This creates a directory `_plots` containing `png` figures and
   `html` files that facilitate viewing these plots.

   To view them, start by opening the file `_plots/_PlotIndex.html`
   in web browser.

   Or on SageMathCloud (or a Mac) you can do:

        open _plots/_PlotIndex.html


## Dependencies

A command like `make .exe` creates a hidden file `.exe` (visible only if you
use `ls -a`, for example) that is used to keep track of when the executable
was created.  So only Fortran files that have been changed will be
recompiled if you type `make .exe` again.

The command `make .output` checks to see if `.exe` or `.data` are newer than
the file `.output`, and if so it recursively calls `make .exe` or `make
.data` as needed.  So if you modify `setrun.py` and then do `make .output`
it will first create new versions of the `*.data` files.

Only execution of `setrun.py` is being tracked, so if you changed the
topography file, for example, without modifying `setrun.py` you might find
that typing `make .output` gives the message:

    make: `.output' is up to date.

You can force the code to run again by removing `.output` before typing
`make .output`.

Similarly, `make .plots` will make plots using the contents of the `_output`
directory, but first checks that these output files are up to date by
implicitly doing `make .output`.  

If you want to make sure it doesn't re-run the code, you can instead do

    make plots

without the `.` in `.plots` and it will use whatever is in `_output` without
checking dependencies.

