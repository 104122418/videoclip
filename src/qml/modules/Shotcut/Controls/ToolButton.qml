/*
 * Copyright (c) 2020-2022 Meltytech, LLC
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
import Shotcut.Controls as Shotcut

ToolButton {
    id: control

    icon.height: control.height - (verticalPadding * 2)
    icon.width: control.height - (horizontalPadding * 2)
    padding: 3
    opacity: enabled ? 1 : 0.5
    palette.button: checked ? activePalette.highlight : activePalette.button

    SystemPalette {
        id: activePalette
    }
}
