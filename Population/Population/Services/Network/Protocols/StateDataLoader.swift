//
//  StateDataLoader.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation
import Combine

public protocol StateDataLoader {
    typealias Result = AnyPublisher<StateResponse, Error>

    func loadData(from url: URL) -> Result
}
