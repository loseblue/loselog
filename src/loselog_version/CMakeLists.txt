add_library(
  loselog_version STATIC ${CMAKE_CURRENT_SOURCE_DIR}/include/loselog_version.h
                       ${CMAKE_CURRENT_SOURCE_DIR}/src/loselog_version.cpp
)

target_include_directories(loselog_version PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(loselog_version PUBLIC project_options project_warnings Qt${QT_VERSION_MAJOR}::Core)

add_dependencies(loselog_version generate_version)
