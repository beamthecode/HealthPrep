//
//  MealPlanFavorites.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/26/23.
//

import Foundation


class MealPlanFavorites: ObservableObject {
    private var mealPlans: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                mealPlans = decoded
                return
            }
        }
        
        mealPlans = []
    }
    
    func contains(_ mealPlan: MealPlan) -> Bool {
        mealPlans.contains(mealPlan.id)
    }
    
    func add(_ mealPlan: MealPlan) {
        objectWillChange.send()
        mealPlans.insert(mealPlan.id)
        save()
    }
    
    func remove(_ mealPlan: MealPlan) {
        objectWillChange.send()
        mealPlans.remove(mealPlan.id)
        save()
        
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(mealPlans) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
}
