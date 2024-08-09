//
//  NationModel.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation

public struct NationModel: Decodable {
    let id: String?
    let nation: String?
    let yearID: Int?
    let year: String?
    let population: Int?
    let slugNation: String?
    
    enum CodingKeys: String, CodingKey {
        case id = "ID Nation"
        case nation = "Nation"
        case yearID = "ID Year"
        case year = "Year"
        case population = "Population"
        case slugNation = "Slug Nation"
    }
}
