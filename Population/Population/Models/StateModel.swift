//
//  StateModel.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation

struct StateModel {
    let id: String?
    let state: String?
    let yearID: Int?
    let year: String?
    let population: Int?
    let slugState: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID State"
        case state = "State"
        case yearID = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugState = "Slug State"
    }
}
