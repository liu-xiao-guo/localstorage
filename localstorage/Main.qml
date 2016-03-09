import QtQuick 2.0
import Ubuntu.Components 1.1
import "database.js" as DB

/*!
    \brief MainView with a Label and Button elements.
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    // Note! applicationName needs to match the "name" field of the click manifest
    applicationName: "localstorage.liu-xiao-guo"

    /*
     This property enables the application to change orientation
     when the device is rotated. The default is false.
    */
    //automaticOrientation: true

    // Removes the old toolbar and enables new features of the new header.
    useDeprecatedToolbar: false

    width: units.gu(60)
    height: units.gu(85)

    Page {
        title: i18n.tr("Localstorage")

        Rectangle {
            id: crazy
            objectName: 'crazy'
            width: 200
            height: 200
            x: 50
            y: 50
            color: "#53d769"
            border.color: Qt.lighter(color, 1.1)

            Text {
                anchors.centerIn: parent
                text: Math.round(parent.x) + '/' + Math.round(parent.y)
            }

            MouseArea {
                anchors.fill: parent
                drag.target: parent
            }
        }


        Component.onCompleted: {
            DB.initDatabase();

            print("it is going to read data");
            DB.readData();
        }

        Component.onDestruction: {
            print("it is going to save data");
            DB.storeData();
        }

        Button {
            anchors.bottom: parent.bottom
            anchors.bottomMargin: units.gu(1)
            anchors.horizontalCenter: parent.horizontalCenter
            text: "Close"
            onClicked: {
                Qt.quit();
            }
        }
    }
}

