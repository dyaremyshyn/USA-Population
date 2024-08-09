//
//  NumberFormatterHelper.swift
//  Population
//
//  Created by Dmytro Yaremyshyn on 10/08/2024.
//

import Foundation

struct NumberFormatterHelper {
    
    static var numberFormatter: NumberFormatter {
        let formater = NumberFormatter()
        formater.groupingSeparator = "."
        formater.numberStyle = .decimal
        return formater
    }

}
