import Testing
@testable import DataEnhance
import SwiftHex
import Foundation

@Suite("Array+")
struct ArrayTests {
    @Test("initialize")
    func initializeTest() {
        #expect(try! Array<UInt8>(hex: Hex("48656C6C6F")) == [72, 101, 108, 108, 111]) // Hello
    }
    @Test("return")
    func returnTest() {
        #expect(Data(count: 4).byte == [0, 0, 0, 0])
    }
}
