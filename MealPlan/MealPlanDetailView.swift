//
//  MealPlanDetailView.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/26/23.
//

import SwiftUI

struct MealPlanDetailView: View {
    
    let mealPlan: MealPlan
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    @EnvironmentObject var mealFavorites: MealPlanFavorites
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomTrailing) {
                    Image(decorative: mealPlan.id)
                        .resizable()
                        .scaledToFit()
                    
                    Text(mealPlan.imageCredit)
                        .padding(10)
                        .background(.black.opacity(0.7))
                        .foregroundColor(.white)
                        .offset(x: -5, y: -5)
                }
                
                HStack {
                    if sizeClass == .compact && typeSize > .large {
                        VStack(spacing: 10) { MealPlanInfoView(mealPlan: mealPlan) }
                    } else {
                        MealPlanInfoView(mealPlan: mealPlan)
                    }
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
           
                Group {
                    
                    Text(mealPlan.description)
                        .padding(.vertical)
                    
                    Text("Entrees")
                        .font(.headline)
                        .padding(.vertical)
                    Text(mealPlan.mainOfferings)
                    
                    Text("Sides")
                        .font(.headline)
                        .padding(.vertical)
                    Text(mealPlan.sides)
                    
                    
                    
                    Button(mealFavorites.contains(mealPlan)
                           ? "Remove from Favorites" : "Add to Favorites") {
                        if mealFavorites.contains(mealPlan) {
                            mealFavorites.remove(mealPlan)
                        } else {
                            mealFavorites.add(mealPlan)
                        }
                    }
                           .buttonStyle(.borderedProminent)
                           .padding()
                }
                .padding(.horizontal)
               
            }
        }
        .navigationTitle("\(mealPlan.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        MealPlanDetailView(mealPlan: MealPlan.example)
    }
    .environmentObject(MealPlanFavorites())
}
