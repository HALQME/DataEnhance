//
//  UInt64+.swift
//  DataEnhance
//
//  Created by HALQME on 2024/09/19.
//

import Foundation

extension UInt64 {
    public var data: Data {
        var uint64 = self
        let data = Data(bytes: &uint64, count: MemoryLayout<UInt64>.size)
        return data
    }
}
