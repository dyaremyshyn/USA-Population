//
//  APIHelper.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 09/08/2024.
//

import Foundation

struct APIHelper {
    private static var baseUrl: String {
        "https://datausa.io/api/data"
    }
    
    public static var nationUrl: String {
        baseUrl + "?drilldowns=Nation&measures=Population"
    }
}
