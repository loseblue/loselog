add_library(
  loselog_regex STATIC
  ${CMAKE_CURRENT_SOURCE_DIR}/src/hsregularexpression.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/regularexpression.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/src/booleanevaluator.cpp
  ${CMAKE_CURRENT_SOURCE_DIR}/include/regularexpressionpattern.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/regularexpression.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/hsregularexpression.h
  ${CMAKE_CURRENT_SOURCE_DIR}/include/booleanevaluator.h
)
target_include_directories(loselog_regex PUBLIC "${CMAKE_CURRENT_SOURCE_DIR}/include")
target_link_libraries(
  loselog_regex
  PUBLIC project_options
         project_warnings
         loselog_logging
         loselog_settings
         loselog_utils
         Qt${QT_VERSION_MAJOR}::Core
         robin_hood
         exprtk
)

if(LOSELOG_USE_HYPERSCAN)
  target_link_libraries(loselog_regex PUBLIC loselog_hyperscan)
  target_compile_definitions(loselog_regex PUBLIC LOSELOG_HAS_HS)
elseif(LOSELOG_USE_VECTORSCAN)
  target_link_libraries(loselog_regex PUBLIC loselog_vectorscan)
  target_compile_definitions(loselog_regex PUBLIC LOSELOG_HAS_HS)
endif()

if(LOSELOG_USE_LTO)
  set_property(TARGET loselog_regex PROPERTY INTERPROCEDURAL_OPTIMIZATION TRUE)
endif()
