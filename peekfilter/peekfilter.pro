TEMPLATE = aux

INSTALLS += entry qml

TARGET=peekfilter

entry.files = $$PWD/entries/labs-$${TARGET}.json
entry.path = /usr/share/jolla-settings/entries

qml.files += qml/peekfilter.qml \
             qml/PeekSlider.qml
qml.path = /usr/share/sailfish-settings-labs/$${TARGET}
