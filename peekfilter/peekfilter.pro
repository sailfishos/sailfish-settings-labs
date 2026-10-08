TEMPLATE = aux

INSTALLS += entry qml

TARGET=peekfilter

lupdate_only {
    SOURCES += \
        qml/peekfilter.qml \
        qml/PeekSlider.qml
}

TRANS_TAG = settings-sailfish-labs
TS_FILE = $$OUT_PWD/$${TRANS_TAG}-${TARGET}.ts
EE_QM = $$OUT_PWD/$${TRANS_TAG}-$${TARGET}_eng_en.qm

entry.files = $$PWD/entries/labs-$${TARGET}.json
entry.path = /usr/share/jolla-settings/entries

qml.files += qml/peekfilter.qml \
             qml/PeekSlider.qml
qml.path = /usr/share/sailfish-settings-labs/$${TARGET}

#components.files = $$files(qml/components/*.qml)
#components.path = /usr/share/sailfish-settings-labs/$${TARGET}/components

include(../translations.pri)
