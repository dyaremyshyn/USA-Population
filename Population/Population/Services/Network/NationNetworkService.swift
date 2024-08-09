//
//  NationNetworkService.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation

struct SportsNetworkService: NationDataLoader {
    
    func loadData(from url: URL) -> NationDataLoader.Result {
        return URLSession.shared
            .dataTaskPublisher(for: url)
            .map(\.data)
            .decode(type: NationResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
}
