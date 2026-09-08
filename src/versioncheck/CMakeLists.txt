add_library(
  loselog_versioncheck STATIC ${CMAKE_CURRENT_SOURCE_DIR}/include/versionchecker.h
                            ${CMAKE_CURRENT_SOURCE_DIR}/src/versionchecker.cpp
)

set_target_properties(loselog_versioncheck PROPERTIES AUTOMOC ON)

target_include_directories(loselog_versioncheck PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(
  loselog_versioncheck
  PUBLIC project_options
         project_warnings
         loselog_settings
         loselog_utils
         Qt${QT_VERSION_MAJOR}::Network
)
