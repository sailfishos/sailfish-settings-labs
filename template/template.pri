INSTALLS += entry qml

NAME=template

entry.files = $$PWD/entries/$${NAME}.json
entry.path = /usr/share/jolla-settings/entries

qml.files = qml
qml.path = /usr/share/sailfish-settings-labs/$${NAME}
