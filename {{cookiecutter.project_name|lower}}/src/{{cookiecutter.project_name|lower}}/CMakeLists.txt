set(curdir "${CMAKE_CURRENT_SOURCE_DIR}")

# Add further source from this directory to the library
list(APPEND f90-sources
    "${curdir}/version.f90"
)

set(f90-sources "${f90-sources}" PARENT_SCOPE)
