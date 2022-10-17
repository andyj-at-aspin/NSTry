import Foundation
import Dispatch

import XCTest
@testable import NSTry

final class NSTryTests: XCTestCase {
    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        do {
            let filename = "/tmp/nstry_test.txt"
            let string = "my hairy big bunny"
            
            _ = try? "".write(toFile: filename, atomically: true, encoding: .utf8)
            
            guard let fileHandle = FileHandle(forUpdatingAtPath: filename) else { return }
            guard let data = string.data(using: .utf8) else { return }

            // will cause seekToEndOfFile to throw an excpetion
            fileHandle.closeFile()


            try NSTry.catchException {
                fileHandle.seekToEndOfFile()
                fileHandle.write(data)
            }
            XCTFail("This went wrong")
        } catch {
            print()
            print("This went right")
            print("Error \(error)")
            print()
        }
    }
}
