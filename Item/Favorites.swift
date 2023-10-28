//
//  Favorites.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/21/23.
//

import Foundation

class Favorites: ObservableObject {
    private var items: Set<String>
    private let saveKey = "Favorites"
    
    init() {
        if let data = UserDefaults.standard.data(forKey: saveKey) {
            if let decoded = try? JSONDecoder().decode(Set<String>.self, from: data) {
                items = decoded
                return
            }
        }
        
        items = []
    }
    
    func contains(_ item: Item) -> Bool {
        items.contains(item.id)
    }
    func add(_ item: Item) {
        objectWillChange.send()
        items.insert(item.id)
        save()
    }
    
    func remove(_ item: Item) {
        objectWillChange.send()
        items.remove(item.id)
        save()
        
    }
    
    func save() {
        if let data = try? JSONEncoder().encode(items) {
            UserDefaults.standard.set(data, forKey: saveKey)
        }
    }
}
