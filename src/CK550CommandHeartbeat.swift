//
//  CK550CommandHeartbeat.swift
//  ck550-cli
//
//  Created by Michal Duda on 15/12/2018.
//  Copyright © 2018 Michal Duda. All rights reserved.
//

import Foundation

extension CK550Command.OffEffectOverride {
    struct Heartbeat {
        enum Speed: uint8 {
            typealias RawValue = uint8
            case lowest = 0x01
            case lower = 0x02
            case middle = 0x03
            case higher = 0x05
            case highest = 0x09
        }

// swiftlint:disable identifier_name
        static var setEffectUNKNOWN_BEFORE_PACKETS: [uint8] {
            return CK550Command.newCommand(request: [0x56, 0x81, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        }
// swiftlint:enable identifier_name

        static func setEffect(background: RGBColor, key: RGBColor?, speed: Speed) -> [[uint8]] {
            var result: [[uint8]] = [
                [0x56, 0x83, 0x00, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0xC1, 0x00, 0x00, 0x00, 0x00, 0x32, 0x3C, 0x46, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x20, 0xA0, 0x00, 0x80, 0x20, 0x10, 0x00, 0x00, 0xFE, 0xFD, 0xFC, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x02, 0xFF, 0x00, 0x03, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF],

                [0x56, 0x83, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x09, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
            ]

            result[0][24] = UInt8(background.red)
            result[0][25] = UInt8(background.green)
            result[0][26] = UInt8(background.blue)

            result[0][46] = speed.rawValue

            if let key = key {
                result[0][40] = UInt8(key.red)
                result[0][41] = UInt8(key.green)
                result[0][42] = UInt8(key.blue)
                result[0][44] = 0x00
            } else {
                result[0][44] = 0x02
            }
            return result
        }
    }
}
