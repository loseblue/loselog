find_package(QT NAMES Qt6 Qt5 COMPONENTS Test REQUIRED)
find_package(Qt${QT_VERSION_MAJOR} COMPONENTS Test REQUIRED)

add_subdirectory(helpers)
add_subdirectory(unit)
add_subdirectory(ui)

add_dependencies(loselog_itests file_write_helper)
add_dependencies(ci_build loselog_tests loselog_itests)






