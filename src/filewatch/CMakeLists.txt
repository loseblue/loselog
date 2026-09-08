add_library(
  loselog_filewatch STATIC ${CMAKE_CURRENT_SOURCE_DIR}/include/filewatcher.h
                         ${CMAKE_CURRENT_SOURCE_DIR}/src/filewatcher.cpp
)

set_target_properties(loselog_filewatch PROPERTIES AUTOMOC ON)

target_include_directories(loselog_filewatch PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(
  loselog_filewatch
  PUBLIC loselog_settings
         loselog_utils
         kdtoolbox
         efsw
)

if(LOSELOG_USE_LTO)
  set_property(TARGET loselog_filewatch PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
endif()
