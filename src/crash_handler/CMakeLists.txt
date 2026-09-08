add_library(
  loselog_crash_handler STATIC
  ${CMAKE_CURRENT_SOURCE_DIR}/include/crashhandler.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/issuereporter.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/memory_info.h
  ${CMAKE_CURRENT_SOURCE_DIR}/src/issuereporter.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/memory_info.cpp
)

set_target_properties(loselog_crash_handler PROPERTIES AUTOMOC ON)

target_include_directories(loselog_crash_handler PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(
  loselog_crash_handler
  PUBLIC project_options
         project_warnings
         loselog_version
         loselog_utils
         tbb
         Qt${QT_VERSION_MAJOR}::Gui
         Qt${QT_VERSION_MAJOR}::Widgets
)

if(LOSELOG_USE_SENTRY)
  target_compile_definitions(loselog_crash_handler PUBLIC -DLOSELOG_USE_SENTRY)
  target_sources(loselog_crash_handler PUBLIC ${CMAKE_CURRENT_SOURCE_DIR}/src/crashhandler.cpp)
  target_link_libraries(loselog_crash_handler PUBLIC sentry crashpad_client)
endif()

if(LOSELOG_USE_LTO)
  set_property(TARGET loselog_crash_handler PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
endif()
