cmake_minimum_required(VERSION 3.5.1)
project(SuWidget
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
        )

set(HEADERS
        ctkPimpl.h ctkRangeSlider.h
        LCD.h
        LED.h
        Histogram.h
        ColorChooserButton.h
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
        Version.h SuWidgetsHelpers.h WFHelpers.h
        )

add_library(SuWidgets SHARED ${SOURCES} ${HEADERS})

target_include_directories(SuWidgets
        PUBLIC ${CMAKE_SOURCE_DIR}
        )

target_link_libraries(SuWidgets
        PUBLIC
        sigutils::sigutils suscan::suscan
        Qt5::Widgets Qt5::OpenGL
        fftw3
        )