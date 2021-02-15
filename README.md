# popf  (For MacOS)

**Kludge required:** In order to fix a #include <values.h>, it is (currently) necessary to create a symlink in:
*/usr/local/opt/gcc@8/include/c++/8.3.0*  that links:  *values.h -> tr1/limits.h*

Whilst I now have newer versions of both GCC (@10) and Apple Clang 12.0.0, the project was able to build using my existing GCC@8 install.
From the parent folder of the repo, do the following:

    mkdir build
    cd build
    CC=/usr/local/opt/gcc@8/bin/gcc-8 CXX=/usr/local/opt/gcc@8/bin/g++-8 cmake ../
    CC=/usr/local/opt/gcc@8/bin/gcc-8 CXX=/usr/local/opt/gcc@8/bin/g++-8 make

**NOTE** you may need to adjust the paths to reflect the location of GCC@8 on your system.


The POPF planner from KCL planning group with some modifications to make it work with "modern" compilers...
This version has been updated to build under MacOS with Homebrew.
=== POPF1.1 ===

This archive contains the source release of POPF, as described in the 2010 ICAPS paper, plus a few bug fixes.  The directory 'src/popf' contains the sources of the planner itself, and the directory 'src/VALfiles' contains PDDL parsing and action instantiation code, taken from VAL (the PDDL validator).  Contact details for the authors are available from the Strathclyde Planning Group Website:

http://planning.cis.strath.ac.uk/

In the first instance, for bug reports or technical discussions, contact Andrew Coles (firstname.lastname@cis.strath.ac.uk).

== Compiling POPF ==

A precompiled, statically linked binary of POPF for Linux x86 is available to download.  For those wishing to compile POPF themselves, carry on reading, otherwise, skip to the 'Running POPF' section.

Build prerequisites:
- GCC (Clang will not build POPF, so you need to actually use GCC)
- cmake ( http://www.cmake.org/ )
- Coin-OR libraries (cbc, cgl, clp, coinutils, and osi ) mixed integer programming solver ( https://projects.coin-or.org )
- perl, bison and flex to build the parser
  The vesions of Perl and Bison supplied with MacOS work fine.  However, I had an issue with Flex whereby cmake was unable to find the "FlexLexer.h" header file.  I fixed this problem by installing Homebrew's version of Flex *brew install flex*, and hardcoding the path to the include folder in the necessary cmake/script files.  Perhaps not the most efficient option but it got POPF to  it work.
  **Important**:  Homebrew's Flex is unable to parse extended unicode characters, thus it was required to reduce the allowed ASCII characters when forming labels to a..zA..Z_ (see parser/pddl+.lex ).


Homebrew packages:
    brew install gcc
    brew tap coin-or-tools/coinor
    brew install osi clp cbc coinutils
    
Once installed, open a terminal and type the following:

    cd into this repository
    mkdir build
    cd build
    *Either*
      export CC=/usr/local/bin/gcc-8
      export CXX=/usr/local/bin/g++-8
      cmake ..
    *or*
      CC=/usr/local/bin/gcc-8 CXX=/usr/local/bin/g++-8 cmake ..
    *then*
      make  (use VERBOSE=1 if you need to see/debug the build)

It may be necessary to re-arrange your PATH variable so /usr/local/bin is looked into before other locations, but I did not require this.
Assuming all went well, the following executables have been created:
    POPF Planner       :    *build/src/popf/popf*
    PDDL Parser         :    *build/src/VALfiles/parser
    PDDL+ Validator   :    *build/src/VALfiles/validate
Not sure how popf-clp was supposed to be generated, but it's not from the enclosed cmake files.

== Running POPF ==
To read the original README.md file, please look at the repo I forked:  https://github.com/LCAS/popf
Here I will add information about the version of POPF that's actually built.  The discrepancies between the information in the original README.md and what was built leave me uncertain as to what is actually delivered by this repo.  

To access some useful *usage* info that includes explanations of various options type **./popf** without any parameters.

To run POPF with a specified domain and problem instance, type:
    popf domain.pddl problem.pddl

If you are using POPF in a paper, to print the appropriate BibTeX reference run:
    popf -citation


== Known Issues (Carried over from original README.md)==

There used to be some (known) bugs affecting the enhanced heuristic.  Those should be fixed now; but, if it crashes or exhibits other strange behaviour, try running with the -c option, as described above.  If you have a particularly small domain and problem file pair for which passing -c to POPF fixes the bug, then email Andrew Coles - such files are useful for debugging.

Otherwise, if -c doesn't fix the problem, and POPF crashes, then you may want to compile with debugging information.  Change build/buildscript, and follow the instructions given in the comments (instead of passing RelWithDebInfo to cmake, pass Debug).  Then, run the newly built popf binary, and send the output it produces along with your domain and problem file to Andrew Coles (firstname.lastname@cis.strath.ac.uk).
(The repo does not in)


== Licence ==

POPF is free software: you can redistribute it and/or modify
it under the terms of the GNU General Public License as published by
the Free Software Foundation, either version 2 of the License, or
(at your option) any later version.

POPF is distributed in the hope that it will be useful,
but WITHOUT ANY WARRANTY; without even the implied warranty of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
GNU General Public License for more details.

For details of the license, see the file LICENCE in this directory.

