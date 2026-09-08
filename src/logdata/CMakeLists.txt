add_library(
  loselog_logdata STATIC
  ${CMAKE_CURRENT_SOURCE_DIR}/include/abstractlogdata.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/compressedlinestorage.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/encodingdetector.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/linepositionarray.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/loadingstatus.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/logdata.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/logdataoperation.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/logdataworker.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/logfiltereddata.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/logfiltereddataworker.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/linetypes.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/fileholder.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/filedigest.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/readablesize.h
  ${CMAKE_CURRENT_SOURCE_DIR}/src/abstractlogdata.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/compressedlinestorage.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/encodingdetector.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/logdata.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/logdataoperation.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/logdataworker.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/logfiltereddata.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/logfiltereddataworker.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/fileholder.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/filedigest.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/readablesize.cpp
  src/filedigest.cpp
)

set_target_properties(loselog_logdata PROPERTIES AUTOMOC ON)

target_include_directories(loselog_logdata PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_compile_definitions(loselog_logdata PUBLIC "-DQT_NO_KEYWORDS")

target_link_libraries(
  loselog_logdata
  PUBLIC project_options
         project_warnings
         loselog_crash_handler
         loselog_settings
         loselog_utils
         loselog_regex
         loselog_filewatch
         Qt${QT_VERSION_MAJOR}::Core
         roaring
         roaring-headers-cpp
         roaring-headers
         tbb
         type_safe
         loselog_uchardet_wrapper
         kdtoolbox
         robin_hood
         simdutf
         streamvbyte
         loselog_mimalloc_wrapper
)

target_link_libraries(loselog_logdata PRIVATE xxhash)

if(${QT_VERSION_MAJOR} GREATER_EQUAL 6)
  find_package(
    Qt6
    COMPONENTS Core5Compat
    REQUIRED
  )
  target_link_libraries(loselog_logdata PUBLIC Qt${QT_VERSION_MAJOR}::Core5Compat)
endif()

if(LOSELOG_USE_LTO)
  set_property(TARGET loselog_logdata PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
endif()
