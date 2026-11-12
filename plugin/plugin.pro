TEMPLATE = lib
TARGET = sailfishsettingslabsplugin
TARGET = $$qtLibraryTarget($$TARGET)

MODULENAME = Sailfish/Settings/Labs
TARGETPATH = $$[QT_INSTALL_QML]/$$MODULENAME

QT += qml
CONFIG += plugin

SOURCES += \
    plugin.cpp

OTHER_FILES  = *.qml *.js qmldir

import.files = *.qml *.js qmldir
import.path = $$TARGETPATH
target.path = $$TARGETPATH

TS_FILE = $$OUT_PWD/settings-sailfish-labs.ts
EE_QM = $$OUT_PWD/settings-sailfish-labs_eng_en.qm

translations.commands += lupdate $$IN_PWD/.. -ts $$TS_FILE
# translations.depends = $$PWD/*.qml
translations.CONFIG += no_check_exist no_link
translations.output = $$TS_FILE
translations.input = .

translations_install.files = $$TS_FILE
translations_install.path = /usr/share/translations/source
translations_install.CONFIG += no_check_exist

engineering_english.commands += lrelease -idbased $$TS_FILE -qm $$EE_QM
engineering_english.CONFIG += no_check_exist no_link
engineering_english.depends = translations
engineering_english.input = $$TS_FILE
engineering_english.output = $$EE_QM

engineering_english_install.path = /usr/share/translations
engineering_english_install.files = $$EE_QM
engineering_english_install.CONFIG += no_check_exist

QMAKE_EXTRA_TARGETS += translations engineering_english

PRE_TARGETDEPS += translations engineering_english

INSTALLS += target import translations_install engineering_english_install
