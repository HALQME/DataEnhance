//
//  Data+.swift
//  DataEnhance
//
//  Created by HALQME on 2024/09/19.
//
import Foundation
import SwiftHex

extension Data {
    public var byte: Array<UInt8> {
        return Array(self)
    }

    public init(hex: Hex) {
        self.init(Array<UInt8>(hex: hex))
    }
}
