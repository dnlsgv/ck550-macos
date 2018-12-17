//
//  AssembleCommandCrosshair.swift
//  ck550-cli
//
//  Created by Michal Duda on 15/12/2018.
//  Copyright © 2018 Michal Duda. All rights reserved.
//

import Foundation

extension AssembleCommand {
    static func assembleCommandCrosshair(background: RGBColor, key: RGBColor, speed: CK550Command.OffEffectOverride.Crosshair.Speed) throws -> CK550HIDCommand {
        let command = CK550HIDCommand()
        command.addOutgoingMessage(CK550Command.setEffectControl)
        command.addOutgoingMessage(CK550Command.setEffect(effectId: .off))
        command.addOutgoingMessage(CK550Command.enableOffEffectModification)

        command.addOutgoingMessage(CK550Command.OffEffectOverride.Crosshair.setEffectUNKNOWN_BEFORE_PACKETS)

        let packets = CK550Command.OffEffectOverride.Crosshair.setEffect(speed: speed, background: background, key: key)
        for packet in packets {
            command.addOutgoingMessage(packet)
        }

        command.addOutgoingMessage(CK550Command.setEffect(effectId: .off))
        command.addOutgoingMessage(CK550Command.setFirmwareControl)

        return command
    }
}
