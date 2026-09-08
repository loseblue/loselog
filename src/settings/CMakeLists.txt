add_library(
  loselog_settings STATIC
  ${CMAKE_CURRENT_SOURCE_DIR}/src/persistentinfo.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/configuration.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/shortcuts.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/styles.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/include/persistable.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/persistentinfo.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/configuration.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/styles.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/shortcuts.h
)

target_include_directories(loselog_settings PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(
  loselog_settings
  PUBLIC project_options
         project_warnings
         loselog_utils
         Qt${QT_VERSION_MAJOR}::Core
         Qt${QT_VERSION_MAJOR}::Gui
)

if(LOSELOG_USE_LTO)
  set_property(TARGET loselog_settings PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
endif()
