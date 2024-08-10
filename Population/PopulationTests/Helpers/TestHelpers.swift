//
//  TestHelpers.swift
//  PopulationTests
//
//  Created by Dmytro Yaremyshyn on 10/08/2024.
//

import Foundation
@testable import Population

struct TestHelper {
    
    static var anyError: NSError {
        NSError(domain: "TestError", code: 999, userInfo: nil)
    }
    
    static var anyErrorMessage: String {
        "An error occurred"
    }
    
    static var anyURL: URL {
        URL(string: "www.any-url.com")!
    }
    
    static var anySuccessResponse: NationResponse {
        NationResponse(data: [
            NationModel(
                id: "12345",
                nation: "USA",
                yearID: 2024,
                year: "2024",
                population: 392018567,
                slugNation: "USA-2024"
            ),
            NationModel(
                id: "67890",
                nation: "USA",
                yearID: 2023,
                year: "2023",
                population: 388068792,
                slugNation: "USA-2023"
            )
        ])
    }
}
