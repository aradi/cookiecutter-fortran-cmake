#
# Demonstrates and tests how other projects can use {{cookiecutter.project_name}}
#
cmake_minimum_required(VERSION 3.16)

project(TestBuild LANGUAGES Fortran)

find_package({{cookiecutter.project_name}} REQUIRED)

add_executable(test_build test_build.f90)
target_link_libraries(test_build {{cookiecutter.project_name}}::{{cookiecutter.project_name}})
