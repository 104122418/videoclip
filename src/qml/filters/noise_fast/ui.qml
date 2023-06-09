/*
 * Copyright (c) 2019-2021 Meltytech, LLC
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
    property string noise: 'av.all_strength'
    property double noiseDefault: 20

    function setControls() {
        noiseSlider.value = filter.getDouble(noise);
    }

    width: 350
    height: 100
    Component.onCompleted: {
        if (filter.isNew) {
            filter.set('av.all_flags', 'a+t');
            filter.set(noise, noiseDefault);
            filter.savePreset(preset.parameters);
        }
        setControls();
    }

    GridLayout {
        anchors.fill: parent
        anchors.margins: 8
        columns: 3

        Label {
            text: qsTr('Preset')
            Layout.alignment: Qt.AlignRight
        }

        Shotcut.Preset {
            id: preset

            parameters: [noise]
            Layout.columnSpan: 3
            onPresetSelected: setControls()
        }

        Label {
            text: qsTr('Amount')
            Layout.alignment: Qt.AlignRight
        }

        Shotcut.SliderSpinner {
            id: noiseSlider

            minimumValue: 0
            maximumValue: 100
            stepSize: 0.1
            decimals: 1
            suffix: ' %'
            onValueChanged: filter.set(noise, noiseSlider.value)
        }

        Shotcut.UndoButton {
            onClicked: noiseSlider.value = noiseDefault
        }

        Item {
            Layout.fillHeight: true
        }
    }
}
