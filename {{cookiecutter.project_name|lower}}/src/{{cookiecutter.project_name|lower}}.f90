!> Main module file for the {{cookiecutter.project_name|lower}} library
module {{cookiecutter.project_name|lower}}
  use {{cookiecutter.project_name|lower}}_version, only : get_version
  implicit none

  private
  public :: get_version

end module {{cookiecutter.project_name|lower}}
