TEMPLATE = app
TARGET = localstorage

load(ubuntu-click)

QT += qml quick

SOURCES += main.cpp

RESOURCES += localstorage.qrc

OTHER_FILES += localstorage.apparmor \
               localstorage.desktop \
               localstorage.png

#specify where the config files are installed to
config_files.path = /localstorage
config_files.files += $${OTHER_FILES}
message($$config_files.files)
INSTALLS+=config_files

# Default rules for deployment.
target.path = $${UBUNTU_CLICK_BINARY_PATH}
INSTALLS+=target

