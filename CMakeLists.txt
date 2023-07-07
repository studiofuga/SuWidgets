cmake_minimum_required(VERSION 3.5.1)
project(SuWidgets
        VERSION 0.3.0
        )

list(APPEND CMAKE_MODULE_PATH ${CMAKE_SOURCE_DIR}/cmake)

OPTION(PKGVERSION "Package Version")

find_package(sigutils 0.3.0 REQUIRED)
find_package(suscan 0.3.0 REQUIRED)
find_package(Qt5 5.9.0 REQUIRED COMPONENTS Widgets OpenGL)

set(CMAKE_AUTOMOC ON)
set(CMAKE_AUTOUIC ON)
set(CMAKE_AUTORCC ON)

set(CMAKE_CXX_STANDARD 14)
set(CMAKE_POSITION_INDEPENDENT_CODE on)

set(SOURCES
        icons.qrc
        ctkRangeSlider.cpp
        LCD.cpp
        LED.cpp
        Histogram.cpp
        Constellation.cpp
        QVerticalLabel.cpp
        SymView.cpp Decider.cpp
        TimeSpinBox.cpp TimeSpinBox.ui
        Waveform.cpp WaveView.cpp WaveViewTree.cpp
        Waterfall.cpp
        ColorChooserButton.cpp ColorChooserButton.ui
        ContextAwareSpinBox.cpp
        SciSpinBox.cpp SciSpinBox.ui
        FrequencySpinBox.cpp FrequencySpinBox.ui
        TVDisplay.cpp
        MultiToolBox.cpp MultiToolBox.ui
        GLWaterfall.cpp
        ThrottleableWidget.cpp SuWidgetsHelpers.cpp WFHelpers.cpp
        Transition.cpp
        )

set(HEADERS
        ctkPimpl.h ctkRangeSlider.h
        LCD.h
        LED.h
        Histogram.h
        Constellation.h
        QVerticalLabel.h
        SymView.h Decider.h
        TimeSpinBox.h
        Waveform.h WaveView.h YIQ.h WaveWorker.h WaveViewTree.h
        Waterfall.h
        ColorChooserButton.h
        ContextAwareSpinBox.h
        SciSpinBox.h
        FrequencySpinBox.h
        TVDisplay.h
        MultiToolBox.h
        GLWaterfall.h
        ThrottleableWidget.h
        Transition.h
        Version.h SuWidgetsHelpers.h WFHelpers.h
        )

add_library(SuWidgets SHARED ${SOURCES} ${HEADERS})

target_include_directories(SuWidgets
        INTERFACE $<INSTALL_INTERFACE:include>
        PRIVATE ${CMAKE_SOURCE_DIR}
        )

target_link_libraries(SuWidgets
        PUBLIC
        sigutils::sigutils suscan::suscan
        Qt5::Widgets Qt5::OpenGL
        fftw3
        )

# Target properties
set_property(TARGET SuWidgets PROPERTY EXPORT_NAME ${PROJECT_NAME})

# PC file generation
#include(PcFileGenerator)
#target_pc_file_generate(SuWidgets "SuWidget library")


include(GNUInstallDirs)

set(INSTALL_EXPORTS_DIR ${CMAKE_INSTALL_LIBDIR}/cmake/suwidgets)

# File install
install(TARGETS SuWidgets
        EXPORT suwidgets-export
        LIBRARY DESTINATION ${CMAKE_INSTALL_LIBDIR}
        INCLUDES DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/suwidgets)

install(FILES ${HEADERS} DESTINATION ${CMAKE_INSTALL_INCLUDEDIR}/suwidgets COMPONENT DEVEL)

#install(FILES ${PROJECT_BINARY_DIR}/suwidgets.pc DESTINATION ${CMAKE_INSTALL_PKGCONFIGDIR} COMPONENT DEVEL)

install(EXPORT suwidgets-export
        FILE suwidgetsTargets.cmake
        NAMESPACE suwidgets::
        DESTINATION ${INSTALL_EXPORTS_DIR}
        )

set(TARGETS_EXPORT_NAME "suwidgetsTargets")

include(CMakePackageConfigHelpers)

configure_package_config_file(
        ${CMAKE_SOURCE_DIR}/cmake/suwidgetsConfig.cmake.in
        ${CMAKE_CURRENT_BINARY_DIR}/suwidgetsConfig.cmake
        INSTALL_DESTINATION ${INSTALL_EXPORTS_DIR}
        PATH_VARS CMAKE_INSTALL_INCLUDEDIR)

write_basic_package_version_file(
        ${CMAKE_BINARY_DIR}/suwidgetsConfigVersion.cmake
        VERSION ${PROJECT_VERSION}
        COMPATIBILITY SameMajorVersion)

install(FILES
        ${CMAKE_CURRENT_BINARY_DIR}/suwidgetsConfig.cmake
        ${CMAKE_BINARY_DIR}/suwidgetsConfigVersion.cmake
        DESTINATION ${INSTALL_EXPORTS_DIR}
        )
