//
//  Data+.swift
//  DataEnhance
//
//  Created by HALQME on 2024/09/19.
//
import Foundation

extension Data {
    public var byte: Array<UInt8> {
        return Array(self)
    }

    public init?(hex: String) {
        let bytes = Array<UInt8>(hex: hex)
        guard let _ = bytes else { return nil}
        self.init(bytes!)
    }
}
