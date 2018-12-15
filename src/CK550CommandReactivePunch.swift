//
//  CK550CommandReactivePunch.swift
//  ck550-cli
//
//  Created by Michal Duda on 15/12/2018.
//  Copyright © 2018 Michal Duda. All rights reserved.
//

import Foundation

extension CK550Command {
    
    enum OffEffectReactivePunchSpeed : uint8 {
        typealias RawValue = uint8
        case Lowest = 0x0E
        case Lower = 0x0A
        case Middle = 0x07
        case Higher = 0x04
        case Highest = 0x01
    }
    
    static var setOffEffectReactivePunchUNKNOWN_BEFORE_PACKETS: [uint8] {
        get {
            return newComand(request: [0x56, 0x81, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        }
    }
    
    static func setOffEffectReactivePunch(background: RGBColor, key: RGBColor?, speed: OffEffectReactivePunchSpeed) -> [[uint8]] {
        var result: [[uint8]] = [
            [0x56, 0x83, 0x00, 0x00, 0x0B, 0x00, 0x0B, 0x00, 0x03, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0xC1, 0x00, 0x00, 0x00, 0x00, 0xFE, 0xFD, 0xFC, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x28, 0x80, 0x00, 0x80, 0x0E, 0x10, 0x00, 0x00, 0x32, 0x3C, 0x45, 0xFF, 0x00, 0x00, 0x01, 0x01, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF],
            
            [0x56, 0x83, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x08, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
        ]
        
        result[0][24] = UInt8(background.red)
        result[0][25] = UInt8(background.green)
        result[0][26] = UInt8(background.blue)
        
        result[0][36] = speed.rawValue
        
        if let key = key {
            result[0][40] = UInt8(key.red)
            result[0][41] = UInt8(key.green)
            result[0][42] = UInt8(key.blue)
            result[0][44] = 0x00
        }
        else {
            result[0][44] = 0x02
        }
        return result
    }
}
