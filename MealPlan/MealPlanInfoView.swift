//
//  MealPlanInfoView.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/26/23.
//

import SwiftUI

struct MealPlanInfoView: View {
    
    let mealPlan: MealPlan
    
    var price: String {
        String(repeating: "$", count: mealPlan.price)
    }
    
    var meals: String {
        mealPlan.meals
    }
    var body: some View {
        Group {
            VStack {
                Text("Info")
                    .font(.caption.bold())
                Text(meals)
                    .font(.title3)
            }
            VStack {
                Text("Price")
                    .font(.caption.bold())
                Text(price)
                    .font(.title3)
            }
        }
        .frame(maxWidth: .infinity)
        
    }
}

#Preview {
    MealPlanInfoView(mealPlan: MealPlan.example)
}
