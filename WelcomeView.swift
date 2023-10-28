//
//  WelcomeView.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/21/23.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to HealthPrep!")
                .font(.largeTitle)
            Text("Please select an item from the left-hand menu; swipe from the left edge to show it!")
                .foregroundColor(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
