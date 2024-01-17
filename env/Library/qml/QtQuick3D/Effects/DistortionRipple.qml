/****************************************************************************
**
** Copyright (C) 2020 The Qt Company Ltd.
** Contact: https://www.qt.io/licensing/
**
** This file is part of Qt Quick 3D.
**
** $QT_BEGIN_LICENSE:GPL$
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see https://www.qt.io/terms-conditions. For further
** information use the contact form at https://www.qt.io/contact-us.
**
** GNU General Public License Usage
** Alternatively, this file may be used under the terms of the GNU
** General Public License version 3 or (at your option) any later version
** approved by the KDE Free Qt Foundation. The licenses are as published by
** the Free Software Foundation and appearing in the file LICENSE.GPL3
** included in the packaging of this file. Please review the following
** information to ensure the GNU General Public License requirements will
** be met: https://www.gnu.org/licenses/gpl-3.0.html.
**
** $QT_END_LICENSE$
**
****************************************************************************/

import QtQuick 2.15
import QtQuick3D 1.15
import QtQuick3D.Effects 1.15

Effect {
    property real radius: 100.0             // 0 - 100
    property real distortionWidth: 10.0     // 2 - 100
    property real distortionHeight: 10.0    // 0 - 100
    property real distortionPhase: 0.0      // 0 - 360
    property vector2d center: Qt.vector2d(0.5, 0.5)

    Shader {
        id: distortionVert
        stage: Shader.Vertex
        shader: "shaders/distortion.vert"
    }

    Shader {
        id: distortionFrag
        stage: Shader.Fragment
        shader: "shaders/distortionripple.frag"
    }

    passes: [
        Pass {
            shaders: [ distortionVert, distortionFrag ]
        }
    ]
}
