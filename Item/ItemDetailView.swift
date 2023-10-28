//
//  ItemDetailView.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/21/23.
//

import SwiftUI

struct ItemDetailView: View {
    
    let item: Item
    
    @Environment(\.horizontalSizeClass) var sizeClass
    @Environment(\.dynamicTypeSize) var typeSize
    
    @EnvironmentObject var favorites: Favorites
    
    
    
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 0) {
                ZStack(alignment: .bottomTrailing) {
                    Image(decorative: item.id)
                        .resizable()
                        .scaledToFit()
                    
                    Text(item.imageCredit)
                        .padding(10)
                        .background(.black.opacity(0.7))
                        .foregroundColor(.white)
                        .offset(x: -5, y: -5)
                }
                
                HStack {
                    if sizeClass == .compact && typeSize > .large {
                        VStack(spacing: 10) { ItemInfoView(item: item) }
                    } else {
                        ItemInfoView(item: item)
                    }
                }
                .padding(.vertical)
                .background(Color.primary.opacity(0.1))
                .dynamicTypeSize(...DynamicTypeSize.xxxLarge)
                
                Group {
                    
                    Text(item.description)
                        .padding(.vertical)
                    
                    Text("Health Facts")
                        .font(.headline)
                        .padding(.vertical)
                    Text(item.healthFacts)
                    
                    
                    Button(favorites.contains(item)
                           ? "Remove from Favorites" : "Add to Favorites") {
                        if favorites.contains(item) {
                            favorites.remove(item)
                        } else {
                            favorites.add(item)
                        }
                    }
                           .buttonStyle(.borderedProminent)
                           .padding()
                }
                .padding(.horizontal)
               
            }
        }
        .navigationTitle("\(item.name)")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NavigationView {
        ItemDetailView(item: Item.example)
    }
    .environmentObject(Favorites())
}
