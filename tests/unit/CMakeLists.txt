# Add test cpp file
add_executable(loselog_tests
    linepositionarray_test.cpp
    patternmatcher_test.cpp
    tests_main.cpp
)

target_link_libraries(loselog_tests loselog_ui loselog_utils loselog_logging Catch2 Qt${QT_VERSION_MAJOR}::Test)
set_target_properties(loselog_tests PROPERTIES AUTOMOC ON)

add_test(
    NAME loselog_tests
    COMMAND loselog_tests -platform offscreen
)