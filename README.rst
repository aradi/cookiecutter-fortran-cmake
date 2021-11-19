**************************
Cookiecutter Fortran-CMake
**************************

This is a cookiecutter template for Fortran projects using the `CMake
<https://cmake.org/>`_ build system. Using this template you can create a
Fortran project from scratch which contains

* a complete CMake setup for building, testing and installing the project,

* separate CMake config file with user customizable options for your project,

* separate directories for the library source and the application which uses
  the library (similar to the directory structure the
  `Fortran Package manager <https://github.com/fortran-lang/fpm>`_ creates),

* unit tests which can be automatically executed,

* integration test, which can check, whether the installed library can be found
  and used by other CMake-based projects and

* GitHub workflow instructions to execute all tests (unit tests, integration
  test) on Linux and Mac OS whenever you push a new commit to GitHub.


Getting started
===============

Install cookiecutter
--------------------

If you are using a Python virtual environment, simply install cookiecutter via
pip::

  pip install -U cookiecutter

Alternatively, you may install it into your home directory via ::

  pip install --user -U cookiecutter

You may also install it via the Conda package manager::

  conda install -c conda-forge cookiecutter


Create a Fortran project
------------------------

Ask Cookiecuttter to create a project with this template::

  cookiecutter gh:aradi/cookiecutter-fortran-cmake

After answering a few questions asked by Cookiecutter, you obtain a fully
functional CMake based projects with the features describe above.


Build the project
-----------------

Your new project can be build by following the usual CMake workflow.

1.  Configure the project.

    Create a build folder somewhere (e.g. ``_build`` within the root of the
    source tree)::

      mkdir _build
      cd _build

    Invoke CMake in order to configure your project. In case you have multiple
    Fortran compilers on your system, make sure you set the one you wish to use
    in the ``FC`` environment variable. Also set the installation prefix, as the
    default is ``/usr``, which you probably do not want to use::

      FC=gfortran cmake -DCMAKE_INSTALL_PREFIX=$HOME/opt/myproject ..

2.  Build the project.

    From within the build folder, invoke make::

      make

3.  Test the project.

    Execute the project tests from within the build folder with ::

      ctest

4.  Install the project.

    Install the project to the desired location by invoking make from within the
    build folder::

      make install


Upload the project to GitHub
----------------------------

Once your project is functional, create a repository for it on GitHub and upload
the project. (Follow GitHubs instructions on how to create a repository and
how to push content to that repository.) Also do not forget to add a license
file to your project.

Your project contains a fully configured GitHub workflow. Whenever you push
a commit to GitHub, or a pull request is made to your project, the tests
in your project (unit test, integration test) will be automatically executed
on Linux and Mac OS. Look up the Actions tab on GitHub to see the results.


Extend your project
-------------------

Just work on your project and extend it step by step. If you add new files,
make sure to register them in the ``CMakeLists.txt`` file in their folder. Once
you have set up your project using this Cookiecutter template, it should be more
or less self-explaining how to add new files, libraries, applications, tests,
etc. to your project.


Why CMake?
==========

`CMake <https://cmake.org/>`_ is a very powerful build tool, used in a lot of
(mostly C++ based) projects, and is perfectly suitable to build Fortran
projects. It is very flexible and lets you realize various build scenarios which
may be difficult or impossible to achieve with other build systems. On the other
hand, its learning curve can be steep, and usually it takes a while until you
have tamed it.  Depending on your needs, it may be an overkill for your project,
or exactly the right tool. Especially, if you have complex mixed language build
scenarios, or if your project should be used (or even built on the fly) by
other CMake based projects, CMake might be the natural choice.

You may also consider to have a look at the
`Fortran Package Manager <https://github.com/fortran-lang/fpm>`_ in case you
are searching for a considerably simpler (but probably less flexible) tool.
Also the `Meson build system <https://mesonbuild.com/>`_ might be a possible
choice for your project.


License
=======

The Cookiecutter Fortran-CMake template is licensed under the
`2-clause BSD license <LICENSE>`_.

Note: The license of the template does not affect the projects you generate with
it, those can be licensed under any arbitrary license.
