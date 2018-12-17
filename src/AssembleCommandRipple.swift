//
//  AssembleCommandRipple.swift
//  ck550-cli
//
//  Created by Michal Duda on 10/12/2018.
//  Copyright © 2018 Michal Duda. All rights reserved.
//

import Foundation

extension AssembleCommand {
    static func assembleCommandRipple(background: RGBColor, key: RGBColor, speed: CK550Command.OffEffectOverride.Ripple.Speed) throws -> CK550HIDCommand {

        let command = CK550HIDCommand()
        command.addOutgoingMessage(CK550Command.setEffectControl)
        command.addOutgoingMessage(CK550Command.setEffect(effectId: .off))
        command.addOutgoingMessage(CK550Command.enableOffEffectModification)

        command.addOutgoingMessage(CK550Command.OffEffectOverride.Ripple.setEffectUNKNOWN_BEFORE_PACKETS)

        let packets = CK550Command.OffEffectOverride.Ripple.setEffect(background: background, key: key, speed: speed)
        for packet in packets {
            command.addOutgoingMessage(packet)
        }

        command.addOutgoingMessage(CK550Command.setEffect(effectId: .off))
        command.addOutgoingMessage(CK550Command.setFirmwareControl)

        return command
    }
}
