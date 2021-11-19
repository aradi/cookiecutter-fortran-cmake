!> Version information related utilities
module {{cookiecutter.project_name|lower}}_version
  implicit none

  private
  public :: get_version

  integer, parameter :: version(3) = [0, 1, 0]


contains

  !> Returns the version number of the library
  subroutine get_version(major, minor, patch)

    !> Major version number
    integer, optional, intent(out) :: major

    !> Minor version number
    integer, optional, intent(out) :: minor

    !> Patch level
    integer, optional, intent(out) :: patch

    if (present(major)) then
      major = version(1)
    end if
    if (present(minor)) then
      minor = version(2)
    end if
    if (present(patch)) then
      patch = version(3)
    end if

  end subroutine get_version


end module {{cookiecutter.project_name|lower}}_version
