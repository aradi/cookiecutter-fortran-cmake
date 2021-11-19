set(f90-sources
    {{cookiecutter.project_name|lower}}app.f90
)

add_executable({{cookiecutter.project_name|lower}}app ${f90-sources})
target_link_libraries({{cookiecutter.project_name|lower}}app {{cookiecutter.project_name|lower}})

install(TARGETS {{cookiecutter.project_name|lower}}app DESTINATION ${CMAKE_INSTALL_BINDIR})