//
//  ContentView.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/21/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Label("Home", systemImage: "house.fill")
                        
                }
            
            ItemView()
                .tabItem {
                    Label("Items", systemImage: "fork.knife")
                }
            
            MealPlanView()
                .tabItem {
                    Label("Meal Plans", systemImage: "frying.pan")
                }
                
        }
    }
       
}

#Preview {
    ContentView()
}
