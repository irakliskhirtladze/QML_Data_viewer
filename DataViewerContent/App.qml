// Copyright (C) 2021 The Qt Company Ltd.
// SPDX-License-Identifier: LicenseRef-Qt-Commercial OR GPL-3.0-only

import QtQuick
import QtQuick.Controls 2.15
import DataViewer
import main_window


Window {
    id: mainWindow
    width: Screen.width
    height: Screen.height

    visible: true
    visibility: Window.Maximized
    title: "DataViewer"


    MainScreenForm {
        id: mainScreen
        anchors.fill: parent
    }

    MainWindow {
        id: main_window
    }


    // Place the TableView into the area defined by table_rect.
    TableView {
        parent: mainScreen.table_rect
        id: dynamicTable
        anchors.fill: parent

    }


    Connections {
        target: mainScreen.load_data_btn
        function onClicked() {
            main_window.load_data()
        }
    }


}



