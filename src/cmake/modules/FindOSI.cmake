# include(FindLibraryWithDebug)

include(CheckSymbolExists)

if (OSI_INCLUDES AND OSI_LIBRARIES)
  set(OSI_FIND_QUIETLY TRUE)
endif (OSI_INCLUDES AND OSI_LIBRARIES)

find_path(OSI_INCLUDES
  NAMES
#  coin/config_osi.h
  coin/Osiconfig.h
  PATHS
  /usr/local/opt/osi/include/osi
#  ${OSIDIR}/include
  ${INCLUDE_INSTALL_DIR}
)

find_library(OSI_LIBRARIES
  Osi
  PATHS
  /usr/local/opt/osi/lib
#  ${OSIDIR}/lib
  ${LIB_INSTALL_DIR}
)


find_library(OSICLP_LIBRARIES
  OsiClp
  PATHS
  /usr/local/opt/osi/lib
#  ${OSIDIR}/lib
  ${LIB_INSTALL_DIR}
)


include(FindPackageHandleStandardArgs)
find_package_handle_standard_args(OSI DEFAULT_MSG
                                  OSI_INCLUDES OSI_LIBRARIES)

mark_as_advanced(OSI_INCLUDES OSI_LIBRARIES)
