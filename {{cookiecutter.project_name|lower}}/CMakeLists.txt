cmake_minimum_required(VERSION 3.16)

# Set basic project properties
project({{cookiecutter.project_name}}
    VERSION 0.1
    DESCRIPTION "{{cookiecutter.short_description}}"
    LANGUAGES Fortran
)

# Set up install directories
include(GNUInstallDirs)
set(INSTALL_INCLUDEDIR "${CMAKE_INSTALL_INCLUDEDIR}/{{cookiecutter.project_name|lower}}")
set(INSTALL_MODULEDIR "${INSTALL_INCLUDEDIR}/fmod")

# Include user customizable config settings
include(config.cmake)

# Build library
add_subdirectory(src)

# Build applications
add_subdirectory(app)

# Build tests
enable_testing()
add_subdirectory(test)


#
# Install package config find, so that other CMake project can find this project
#
include(CMakePackageConfigHelpers)
{% if cookiecutter.project_name|lower != cookiecutter.project_name %}
# Add an alias to export library '{{cookiecutter.project_name|lower}}' as target {{cookiecutter.project_name}}::{{cookiecutter.project_name}}
add_library({{cookiecutter.project_name}} INTERFACE)
target_link_libraries({{cookiecutter.project_name}} INTERFACE {{cookiecutter.project_name|lower}})
install(TARGETS {{cookiecutter.project_name}} EXPORT {{cookiecutter.project_name|lower}}-targets)
{% endif %}
# If project uses customized finders, they should be installed with it
if(EXISTS ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules)
install(
    DIRECTORY ${CMAKE_CURRENT_SOURCE_DIR}/cmake/Modules
    DESTINATION ${CMAKE_INSTALL_LIBDIR}/cmake/{{cookiecutter.project_name|lower}}
)
endif()

# Install project, add namespace
install(
    EXPORT {{cookiecutter.project_name|lower}}-targets
    FILE "{{cookiecutter.project_name|lower}}-targets.cmake"
    NAMESPACE "{{cookiecutter.project_name}}::"
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/{{cookiecutter.project_name|lower}}"
)

# Create and install CMake package config file
configure_package_config_file(
    "${CMAKE_CURRENT_SOURCE_DIR}/cmake/export/{{cookiecutter.project_name|lower}}-config.cmake.in"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/{{cookiecutter.project_name|lower}}-config.cmake"
    INSTALL_DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/{{cookiecutter.project_name|lower}}"
)
write_basic_package_version_file(
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/{{cookiecutter.project_name|lower}}-config-version.cmake"
    VERSION "${PROJECT_VERSION}"
    COMPATIBILITY SameMajorVersion
)
install(
    FILES "${CMAKE_CURRENT_BINARY_DIR}/cmake/{{cookiecutter.project_name|lower}}-config.cmake"
    "${CMAKE_CURRENT_BINARY_DIR}/cmake/{{cookiecutter.project_name|lower}}-config-version.cmake"
    DESTINATION "${CMAKE_INSTALL_LIBDIR}/cmake/{{cookiecutter.project_name|lower}}"
)
