/*

Licensed under the MIT license:

Copyright (c) 2019 Michal Duda

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.

*/

import Foundation

extension CK550Command.OffEffectOverride {
    struct Fireball {
        enum Speed: Int {
            case lowest = 0, lower, middle, higher, highest

            fileprivate var byte: uint8 {
                switch self {
                case .lowest: return 0x36
                case .lower: return 0x18
                case .middle: return 0x0C
                case .higher: return 0x06
                case .highest: return 0x02
                }
            }
        }

// swiftlint:disable identifier_name
        static var setEffectUNKNOWN_BEFORE_PACKETS: [uint8] {
            return CK550Command.newCommand(request: [0x56, 0x81, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x02, 0x00, 0x00, 0x00, 0x88, 0x88, 0x88, 0x88, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00])
        }
// swiftlint:enable identifier_name

        static func setEffect(background: RGBColor, key: RGBColor?, speed: Speed) -> [[uint8]] {
            var result: [[uint8]] = [
                [0x56, 0x83, 0x00, 0x00, 0x0C, 0x00, 0x0C, 0x00, 0x03, 0x00, 0x00, 0x00, 0x07, 0x00, 0x01, 0x00, 0x00, 0x01, 0x00, 0xC1, 0x00, 0x00, 0x00, 0x00, 0x32, 0x3C, 0x46, 0xFF, 0x00, 0x00, 0x00, 0x00, 0x20, 0xA0, 0x00, 0x80, 0x10, 0x10, 0x00, 0x00, 0xFE, 0xFD, 0xFC, 0xFF, 0x00, 0x00, 0x01, 0x00, 0x01, 0x08, 0x09, 0x04, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF],

                [0x56, 0x83, 0x01, 0x00, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0x09, 0x00, 0x09, 0x00, 0x00, 0x00, 0x00, 0x00, 0x04, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00]
            ]

            result[0][24] = UInt8(background.red)
            result[0][25] = UInt8(background.green)
            result[0][26] = UInt8(background.blue)

            result[0][36] = speed.byte

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
