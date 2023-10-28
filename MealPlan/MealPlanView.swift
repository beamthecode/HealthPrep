//
//  MealPlanView.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/26/23.
//

import SwiftUI

enum SortedType {
    case `default`, alphabetical, name
}

struct MealPlanView: View {
    
    let mealPlans: [MealPlan] = Bundle.main.decode("meals.json")
    
    @StateObject var mealFavorites = MealPlanFavorites()
    @State private var searchText = ""
    
    @State private var sortedType = SortedType.default
    @State private var showingSortOptions = false
    
    var body: some View {
        NavigationView {
            List(sortedMealPlans) { mealPlan in
                NavigationLink {
                    MealPlanDetailView(mealPlan: mealPlan)
                } label: {
                    HStack {
                        Image(mealPlan.type)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 80, height: 50)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(mealPlan.name)
                                .font(.headline)
                            Text("\(mealPlan.meals)")
                                .foregroundColor(.secondary)
                        }
                        
                        if mealFavorites.contains(mealPlan) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite item")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Meal Plans")
            .searchable(text: $searchText, prompt: "Search for a Meal Plan")
            .toolbar {
                Button {
                    showingSortOptions = true
                } label: {
                    Label("Change sort order", systemImage: "arrow.up.arrow.down")
                }
            }
            .confirmationDialog("Sort order", isPresented: $showingSortOptions) {
                Button("Default") { sortedType = .default }
                Button("Alphabetical") { sortedType = .alphabetical }
                Button("By Meal Plan") { sortedType = .name }
            }
            
            WelcomeView()
        }
        .environmentObject(mealFavorites)
    }
    
    var filteredMealPlans: [MealPlan] {
        if searchText.isEmpty {
            return mealPlans
        } else {
            return mealPlans.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var sortedMealPlans: [MealPlan] {
        switch sortedType {
        case .default:
            return filteredMealPlans
        case .alphabetical:
            return filteredMealPlans.sorted { $0.name < $1.name }
        case .name:
            return filteredMealPlans.sorted { $0.name < $1.name }
        }
    }
    
            
}
    

#Preview {
    MealPlanView()
}
