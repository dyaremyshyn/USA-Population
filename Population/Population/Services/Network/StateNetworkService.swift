//
//  StateNetworkService.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation
import Combine

struct StateNetworkService: StateDataLoader {
    
    func loadData(from url: URL) -> StateDataLoader.Result {
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: StateResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
