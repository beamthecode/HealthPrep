//
//  ItemInfoView.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/21/23.
//

import SwiftUI

struct ItemInfoView: View {
    
    let item: Item
    
    var price: String {
        String(repeating: "$", count: item.price)
    }
    
    var serving: String {
        item.serving
    }
    
    var body: some View {
        Group {
            VStack {
                Text("Serving Size")
                    .font(.caption.bold())
                Text(serving)
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
    ItemInfoView(item: Item.example)
}
