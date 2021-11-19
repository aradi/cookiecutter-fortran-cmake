
add_executable(test_version test_version.f90)
target_link_libraries(test_version {{cookiecutter.project_name|lower}})
add_test(
    NAME src/test_version
    COMMAND ${CMAKE_CURRENT_BINARY_DIR}/test_version
)
