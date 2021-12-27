#
# User adjustable config options
#
# For a better overview, collect all variables here, which the user may want to override to
# influence the build behaviour
#


# Turn this on, if the libraries should be built as shared libraries
option(BUILD_SHARED_LIBS "Whether the libraries built should be shared" FALSE)


#
# Fortran compiler dependent config options
#

if("GNU" STREQUAL "${CMAKE_Fortran_COMPILER_ID}")

    # Specific settings for the GNU compiler

    set(Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -std=f2008"
        CACHE STRING "General Fortran compiler flags")

    set(Fortran_FLAGS_RELEASE "-O3 -funroll-all-loops"
        CACHE STRING "Extra Fortran compiler flags for Release build")

    set(Fortran_FLAGS_DEBUG "-g -Wall -pedantic -fbounds-check"
        CACHE STRING "Extra Fortran compiler flags for Debug build")

elseif("Intel" STREQUAL "${CMAKE_Fortran_COMPILER_ID}")

    # Specific settings for the Intel compiler

    set(Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -stand f08"
        CACHE STRING "General Fortran compiler flags")

    set(Fortran_FLAGS_RELEASE "-O3 -ip"
        CACHE STRING "Extra Fortran compiler flags for Release build")

    set(Fortran_FLAGS_DEBUG "-g -warn all -check -traceback"
        CACHE STRING "Extra Fortran compiler flags for Debug build")

elseif("NAG" STREQUAL "${CMAKE_Fortran_COMPILER_ID}")

    # Specific settings for the NAG compiler

    set(Fortran_FLAGS "${CMAKE_Fortran_FLAGS} -stand f08"
        CACHE STRING "General Fortran compiler flags")

    set(Fortran_FLAGS_RELEASE "-O3"
        CACHE STRING "Extra Fortran compiler flags for Release build")

    set(Fortran_FLAGS_DEBUG "-g -f2008 -nan -C=all"
        CACHE STRING "Extra Fortran compiler flags for Debug build")

else()

    # Generic compiler settings (using CMake's default values)

    set(Fortran_FLAGS "${CMAKE_Fortran_FLAGS}"
        CACHE STRING "General Fortran compiler flags")

    set(Fortran_FLAGS_RELEASE "${CMAKE_Fortran_FLAGS_RELEASE}"
        CACHE STRING "Extra Fortran compiler flags for Release build")

    set(Fortran_FLAGS_DEBUG "${CMAKE_Fortran_FLAGS_DEBUG}"
        CACHE STRING "Extra compiler flags for Debug build")

endif()
