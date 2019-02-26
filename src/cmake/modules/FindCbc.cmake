# include(FindLibraryWithDebug)

if (CBC_INCLUDES AND CBC_LIBRARY AND CBC_SOLVER_LIBRARY)
  set(CBC_FIND_QUIETLY TRUE)
endif (CBC_INCLUDES AND CBC_LIBRARY AND CBC_SOLVER_LIBRARY)

find_path(CBC_INCLUDES
  NAMES
  coin/CbcModel.hpp
  PATHS
  /usr/local/opt/cbc/include/cbc
#  $ENV{CBCDIR}/include
  ${INCLUDE_INSTALL_DIR}
)

find_library(CBC_LIBRARY
  Cbc
  PATHS
 /usr/local/opt/cbc/lib
# $ENV{CBCDIR}/lib
  ${LIB_INSTALL_DIR}
)

find_library(CBC_SOLVER_LIBRARY
  CbcSolver
  PATHS
  /usr/local/opt/cbc/lib
#  $ENV{CBCDIR}/lib
  ${LIB_INSTALL_DIR}
)


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(Cbc DEFAULT_MSG
                                  CBC_INCLUDES CBC_LIBRARY CBC_SOLVER_LIBRARY)

mark_as_advanced(CBC_INCLUDES CBC_LIBRARY CBC_SOLVER_LIBRARY)
