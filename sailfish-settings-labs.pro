TEMPLATE=subdirs

SUBDIRS += \
    plugin

plugin_entry.path = /usr/share/jolla-settings/entries
plugin_entry.files = sailfish-settings-labs.json

INSTALLS += plugin_entry

entries.files += entries
entries.path = /usr/share/jolla-settings
INSTALLS += entries
