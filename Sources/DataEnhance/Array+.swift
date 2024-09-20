//
//  Array+.swift
//  DataEnhance
//
//  Created by HALQME on 2024/09/19.
//
import Foundation

extension Array where Element == UInt8 {
    private static let hexDigits: [UInt8] = [
        0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 0, 0, 0, 0, 0, 0, 0,
        10, 11, 12, 13, 14, 15, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        10, 11, 12, 13, 14, 15
    ]

    init(reserveCapacity: Int) {
        self = Array<Element>()
        self.reserveCapacity(reserveCapacity)
    }

    public init?(hex: String) {
        self.init(reserveCapacity: hex.count / 2)
        var buffer: UInt8?
        var skip = hex.hasPrefix("0x") ? 2 : 0
        for char in hex.unicodeScalars.lazy {
            guard skip == 0 else {
                skip -= 1
                continue
            }
            
            guard char.value >= 48 && char.value <= 102 else {
                return nil
            }
            
            let v = Array.hexDigits[Int(char.value - 48)]
            
            if let b = buffer {
                append(b << 4 | v)
                buffer = nil
            } else {
                buffer = v
            }
        }
        
        if let b = buffer {
            append(b)
        }
    }

    public func toHexString() -> String {
        let hexDigits = ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f"]
        var result = String(repeating: "0", count: self.count * 2)
        for byte in self {
            result += hexDigits[Int(byte >> 4)]
            result += hexDigits[Int(byte & 0xF)]
        }
        return result
    }
}
