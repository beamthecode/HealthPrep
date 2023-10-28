//
//  ItemView.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/21/23.
//

import SwiftUI

extension View {
    @ViewBuilder func phoneOnlyNavigationView() -> some View {
        if UIDevice.current.userInterfaceIdiom == .phone {
            self.navigationViewStyle(.stack)
        } else {
            self
        }
    }
}

enum SortType {
    case `default`, alphabetical, type
}

struct ItemView: View {
    
    let items: [Item] = Bundle.main.decode("items.json")
    
    @StateObject var favorites = Favorites()
    @State private var searchText = ""
    
    @State private var sortType = SortType.default
    @State private var showingSortOptions = false
    
    var body: some View {
        NavigationView {
            List(sortedItems) { item in
                NavigationLink {
                    ItemDetailView(item: item)
                } label: {
                    HStack {
                        Image(item.type)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 40, height: 25)
                            .clipShape(RoundedRectangle(cornerRadius: 5))
                            .overlay(
                                RoundedRectangle(cornerRadius: 5)
                                    .stroke(.black, lineWidth: 1)
                            )
                        
                        VStack(alignment: .leading) {
                            Text(item.name)
                                .font(.headline)
                            Text("\(item.serving)")
                                .foregroundColor(.secondary)
                        }
                        
                        if favorites.contains(item) {
                            Spacer()
                            Image(systemName: "heart.fill")
                                .accessibilityLabel("This is a favorite item")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("Items")
            .searchable(text: $searchText, prompt: "Search for an Item")
            .toolbar {
                Button {
                    showingSortOptions = true
                } label: {
                    Label("Change sort order", systemImage: "arrow.up.arrow.down")
                }
            }
            .confirmationDialog("Sort order", isPresented: $showingSortOptions) {
                Button("Default") { sortType = .default }
                Button("Alphabetical") { sortType = .alphabetical }
                Button("By Dish Type") { sortType = .type }
            }
            
            WelcomeView()
        }
        .environmentObject(favorites)
    }
    
    var filteredItems: [Item] {
        if searchText.isEmpty {
            return items
        } else {
            return items.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    var sortedItems: [Item] {
        switch sortType {
        case .default:
            return filteredItems
        case .alphabetical:
            return filteredItems.sorted { $0.name < $1.name }
        case .type:
            return filteredItems.sorted { $0.type < $1.type }
        }
    }
    
            
}

#Preview {
        ItemView()
}
