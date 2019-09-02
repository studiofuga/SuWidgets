
equals(QT_MAJOR_VERSION, 5):lessThan(QT_MINOR_VERSION, 9) {
  QMAKE_CXXFLAGS += -std=gnu++11
} else {
  CONFIG += c++14
}

include(ctk.pri)
include(lcd.pri)
include(histogram.pri)
include(constellation.pri)
include(symview.pri)
include(transition.pri)
include(waveform.pri)
include(waterfall.pri)
include(colorchooserbutton.pri)
include(LayerEditor.pri)

HEADERS += ThrottleableWidget.h

SOURCES += ThrottleableWidget.cpp

WIDGET_HEADERS += ThrottleableWidget.h

FORMS += ColorChooserButton.ui LayerEditor.ui

