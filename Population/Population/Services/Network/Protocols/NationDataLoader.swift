//
//  NationDataLoader.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation
import Combine

public protocol NationDataLoader {
    typealias Result = AnyPublisher<NationResponse, Error>

    func loadData(from url: URL) -> Result
}
