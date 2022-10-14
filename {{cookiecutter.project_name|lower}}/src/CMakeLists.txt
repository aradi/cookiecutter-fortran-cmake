# Collect source files for library
set(f90-sources
    {{cookiecutter.project_name|lower}}.f90
)

# Collect source files from subdirectories
add_subdirectory({{cookiecutter.project_name|lower}})

# Build library
add_library({{cookiecutter.project_name|lower}} ${f90-sources})
set_target_properties( {{cookiecutter.project_name|lower}}
  PROPERTIES VERSION ${PROJECT_VERSION}
  SOVERSION ${PROJECT_VERSION_MAJOR}
)


# Store generated mod-files in a separate folder
set(moddir "${CMAKE_CURRENT_BINARY_DIR}/fmod")
set_target_properties({{cookiecutter.project_name|lower}} PROPERTIES
    Fortran_MODULE_DIRECTORY "${moddir}"
)

# Add mod-file directory to include search path for targets depending on the library
target_include_directories({{cookiecutter.project_name|lower}} PUBLIC
    $<BUILD_INTERFACE:${moddir}>
    $<INSTALL_INTERFACE:${INSTALL_MODULEDIR}>
)

# Install the library
install(TARGETS {{cookiecutter.project_name|lower}}
    EXPORT {{cookiecutter.project_name|lower}}-targets
    LIBRARY DESTINATION "${CMAKE_INSTALL_LIBDIR}"
    PUBLIC_HEADER DESTINATION "${CMAKE_INSTALL_INCLUDEDIR}/${INSTALL_INCLUDEDIR}"
)

# Install the folder with the modfiles (needed by projects using the library)
install(DIRECTORY "${moddir}/" DESTINATION "${INSTALL_MODULEDIR}")
