//
//  XCTestCase+MemoryLeakTracking.swift
//  PopulationTests
//
//  Created by Dmytro Yaremyshyn on 10/08/2024.
//

import XCTest

extension XCTestCase {
    func trackForMemoryLeaks(_ instance: AnyObject, file: StaticString = #filePath, line: UInt = #line) {
        addTeardownBlock { [weak instance] in
            XCTAssertNil(instance, "Instance should have been deallocated. Potential memory leak.", file: file, line: line)
        }
    }
}
