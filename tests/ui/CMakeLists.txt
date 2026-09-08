set(UI_TEST_SOURCES
    ${CMAKE_CURRENT_SOURCE_DIR}/qtests_main.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/logdata_test.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/logfiltereddata_test.cpp
    ${CMAKE_CURRENT_SOURCE_DIR}/crawlerwidget_test.cpp
)

if(NOT APPLE)
    LIST(APPEND UI_TEST_SOURCES  ${CMAKE_CURRENT_SOURCE_DIR}/mainwindow_test.cpp)
endif()

add_executable(loselog_itests ${UI_TEST_SOURCES} ${BACKWARD_ENABLE})

target_link_libraries(loselog_itests loselog_ui loselog_utils Catch2 Qt${QT_VERSION_MAJOR}::Test test_utils)
set_target_properties(loselog_itests PROPERTIES AUTOMOC ON)

add_backward(loselog_itests)

add_test(
    NAME loselog_itests
    COMMAND loselog_itests -platform offscreen
)