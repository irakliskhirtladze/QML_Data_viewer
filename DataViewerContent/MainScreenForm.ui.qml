

/*
This is a UI file (.ui.qml) that is intended to be edited in Qt Design Studio only.
It is supposed to be strictly declarative and only uses a subset of QML. If you edit
this file manually, you might introduce QML code that is not supported by Qt Design Studio.
Check out https://doc.qt.io/qtcreator/creator-quick-ui-forms.html for details on .ui.qml files.
*/
import QtQuick
import QtQuick.Controls
import DataViewer

Rectangle {
    id: rectangle
    width: Constants.width
    height: Constants.height

    color: Constants.backgroundColor
    property alias load_data_btn: load_data_btn
    property alias pyvis_rect: pyvis_rect
    property alias table_rect: table_rect

    Rectangle {
        id: top_bar_rect
        height: 167
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 8

        Button {
            id: load_data_btn
            text: qsTr("Load data")
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: 8
            anchors.topMargin: 8
        }
    }

    Rectangle {
        id: main_content_rect
        color: "#ffffff"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: top_bar_rect.bottom
        anchors.bottom: parent.bottom
        anchors.leftMargin: 8
        anchors.rightMargin: 8
        anchors.topMargin: 8
        anchors.bottomMargin: 8

        Rectangle {
            id: table_rect
            width: 989
            color: "#30ff43"
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0
        }

        Rectangle {
            id: pyvis_rect
            color: "#ffc7c7"
            anchors.left: table_rect.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 6
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0
        }
    }
    states: [
        State {
            name: "clicked"
        }
    ]
}
