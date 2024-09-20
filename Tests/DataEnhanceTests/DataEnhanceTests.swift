import Testing
@testable import DataEnhance
import Foundation

@Suite("Array+")
struct ArrayTests {
    @Test("initialize")
    func initializeTest() {
        #expect(try! Array<UInt8>(hex: "48656C6C6F21") == [72, 101, 108, 108, 111, 33]) // Hello!
    }
    @Test("encode")
    func encodeTest() {
        #expect(String(bytes: Array<UInt8>(hex: "48656C6C6F21")! , encoding: .utf8)! == "Hello!") // Hello!
    }
    @Test("return")
    func returnTest() {
        #expect(Data(count: 4).byte == [0, 0, 0, 0])
    }
}
