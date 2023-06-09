/*
 * Copyright (c) 2019-2022 Meltytech, LLC
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU General Public License for more details.
 *
 * You should have received a copy of the GNU General Public License
 * along with this program.  If not, see <http://www.gnu.org/licenses/>.
 */
import QtQuick
import QtQuick.Controls
import QtQuick.Layouts
import Shotcut.Controls as Shotcut

Item {
    property string amount: 'av.frames'
    property int amountDefault: 2

    width: 350
    height: 100
    Component.onCompleted: {
        if (filter.isNew) {
            filter.set(amount, amountDefault);
            filter.savePreset(preset.parameters);
        }
        amountSlider.value = filter.get(amount);
    }

    GridLayout {
        anchors.fill: parent
        anchors.margins: 8
        columns: 4

        Label {
            text: qsTr('Preset')
            Layout.alignment: Qt.AlignRight
        }

        Shotcut.Preset {
            id: preset

            parameters: [amount]
            Layout.columnSpan: parent.columns - 1
            onPresetSelected: amountSlider.value = filter.get(amount)
        }

        Label {
            text: qsTr('Amount')
            Layout.alignment: Qt.AlignRight
        }

        Shotcut.SliderSpinner {
            id: amountSlider

            minimumValue: 2
            maximumValue: Math.round(profile.fps)
            stepSize: 1
            suffix: qsTr(' frames')
            spinnerWidth: 110
            onValueChanged: filter.set(amount, value)
        }

        Shotcut.UndoButton {
            onClicked: amountSlider.value = amountDefault
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
