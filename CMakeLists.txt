cmake_minimum_required(VERSION 3.16)

project(firestormgcs VERSION 0.1 LANGUAGES CXX)


set (CMAKE_C_FLAGS "-O3")
set(CMAKE_CXX_STANDARD_REQUIRED ON)
set(CMAKE_AUTORCC ON)
set(CMAKE_CXX_STANDARD 17)



find_package(Qt6 REQUIRED COMPONENTS Quick Location )

qt_standard_project_setup(REQUIRES 6.8)

qt_add_executable(appfirestormgcs
    source/main.cpp
)
qt_add_qml_module(appfirestormgcs
    URI firestormgcs
    VERSION 1.0
    QML_FILES
    RESOURCES qml.qrc
    RESOURCES qml/dark_icons.qrc
    RESOURCES
    RESOURCES qml/light_icons.qrc
    SOURCES source/imageprovider.h source/imageprovider.cpp
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appfirestormgcs PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appfirestormgcs
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appfirestormgcs
    PRIVATE Qt6::Quick Qt6::Location Qt6::Positioning
)

include(GNUInstallDirs)
install(TARGETS appfirestormgcs
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
    RUNTIME DESTINATION ${CMAKE_INSTALL_BINDIR}
)
