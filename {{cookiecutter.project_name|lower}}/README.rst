{% for n in range(cookiecutter.project_name|length) %}*{% endfor %}
{{cookiecutter.project_name}}
{% for n in range(cookiecutter.project_name|length) %}*{% endfor %}

{{cookiecutter.short_description}}


Installation
============

Building from source
---------------------

The code can be built, tested and installed using the usual CMake workflow::

  mkdir _build
  cd _build
  FC=gfortran cmake -DCMAKE_INSTALL_PREFIX=$HOME/opt/{{cookiecutter.project_name|lower}} ..
  make
  ctest
  make install

If you have ninja available, it can be used instead of make::

  mkdir _build
  cd _build
  FC=gfortran cmake -GNinja -DCMAKE_INSTALL_PREFIX=$HOME/opt/{{cookiecutter.project_name|lower}} ..
  ninja
  ctest
  ninja install

The installation folder is customized via the ``-DCMAKE_INSTALL_PREFIX`` option.
Adjust the value of the `FC` environment variable according to the compiler
you use.


Using the library
=================

Once {{cookiecutter.project_name}} had been installed, it can be easily used by any CMake-based
project. Make sure, that the environment variable `CMAKE_PREFIX_PATH` contains
the root folder of the installed library (e.g.
``export CMAKE_PREFIX_PATH=$HOME/opt/{{cookiecutter.project_name|lower}}``), so
that the `find_package` command can locate the project. A minimal CMakeLists.txt
using the project would look like below::

  cmake_minimum_required(VERSION 3.16)

  project(Use{{cookiecutter.project_name}} LANGUAGES Fortran)

  find_package({{cookiecutter.project_name}} REQUIRED)

  add_executable(project project.f90)
  target_link_libraries(project {{cookiecutter.project_name}}::{{cookiecutter.project_name}})
