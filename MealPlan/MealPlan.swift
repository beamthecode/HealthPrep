//
//  MealPlan.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/21/23.
//

import Foundation

struct MealPlan: Codable, Identifiable {
    let id: String
    let name: String
    let meals: String
    let type: String
    let description: String
    let imageCredit: String
    let price: Int
    let mainOfferings: String
    let sides: String
    
    
    static let allMealPlans: [MealPlan] = Bundle.main.decode("meals.json")
    static let example = allMealPlans[0]
}
