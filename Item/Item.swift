//
//  Item.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/21/23.
//

import Foundation

struct Item: Codable, Identifiable {
    let id: String
    let name: String
    let type: String
    let serving: String
    let description: String
    let imageCredit: String
    let price: Int
    let healthFacts: String
    
    
    static let allItems: [Item] = Bundle.main.decode("items.json")
    static let example = allItems[0]
}
