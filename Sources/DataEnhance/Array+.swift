//
//  Array+.swift
//  DataEnhance
//
//  Created by HALQME on 2024/09/19.
//
import Foundation
import SwiftHex

extension Array where Element == UInt8 {
    init(reserve: Int) {
        self = Array<UInt8>()
        self.reserveCapacity(reserve)
    }

    public init(hex: Hex) {
        let hexString = hex.description
        self.init(reserve: (hexString.count + 1) / 2)

        let hexDigits: [Character: UInt8] = [
            "0": 0, "1": 1, "2": 2, "3": 3, "4": 4, "5": 5, "6": 6, "7": 7, "8": 8, "9": 9,
            "A": 10, "B": 11, "C": 12, "D": 13, "E": 14, "F": 15,
            "a": 10, "b": 11, "c": 12, "d": 13, "e": 14, "f": 15,
        ]

        var buffer: UInt8?

        for char in hexString {
            guard let value = hexDigits[char] else {
                removeAll()
                return
            }

            if let b = buffer {
                append(b << 4 | value)
                buffer = nil
            } else {
                buffer = value
            }
        }

        if let b = buffer {
            append(b)
        }
    }

    public func toHexString() -> String {
        `lazy`.reduce(into: "") {
            var s = String($1, radix: 16)
            if s.count == 1 {
                s = "0" + s
            }
            $0 += s
        }
    }
}
