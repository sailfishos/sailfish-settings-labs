TEMPLATE=subdirs

SUBDIRS += peekfilter

include(template/template.pri)

readme.files += README.md
readme.path = /usr/share/$${TARGET}
INSTALLS += readme

entries.files += entries
entries.path = /usr/share/jolla-settings
INSTALLS += entries
