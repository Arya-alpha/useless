cmake_minimum_required(VERSION 3.16)

project(useless VERSION 0.1 LANGUAGES CXX)

set(CMAKE_AUTOMOC ON)
set(CMAKE_CXX_STANDARD_REQUIRED ON)

find_package(Qt6 6.2 COMPONENTS Quick REQUIRED)

qt_add_executable(appuseless
    main.cpp
)

qt_add_qml_module(appuseless
    URI useless
    VERSION 1.0
    QML_FILES main.qml
    QML_FILES
    QML_FILES
    SOURCES qml/pay.h
    SOURCES qml/pay.cpp
    SOURCES qml/config.h
    SOURCES qml/config.cpp
    QML_FILES qml/Pay.qml
    QML_FILES qml/Pray.qml
    QML_FILES qml/Light.qml
    QML_FILES qml/Donate.qml
)

# Qt for iOS sets MACOSX_BUNDLE_GUI_IDENTIFIER automatically since Qt 6.1.
# If you are developing for iOS or macOS you should consider setting an
# explicit, fixed bundle identifier manually though.
set_target_properties(appuseless PROPERTIES
#    MACOSX_BUNDLE_GUI_IDENTIFIER com.example.appuseless
    MACOSX_BUNDLE_BUNDLE_VERSION ${PROJECT_VERSION}
    MACOSX_BUNDLE_SHORT_VERSION_STRING ${PROJECT_VERSION_MAJOR}.${PROJECT_VERSION_MINOR}
    MACOSX_BUNDLE TRUE
    WIN32_EXECUTABLE TRUE
)

target_link_libraries(appuseless
    PRIVATE Qt6::Quick)

include(GNUInstallDirs)
install(TARGETS appuseless
    BUNDLE DESTINATION .
    LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR})
