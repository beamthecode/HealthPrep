//
//  HomeView.swift
//  HealthPrep
//
//  Created by Brent Beamer on 10/27/23.
//

import SwiftUI

struct HomeView: View {
    
    var body: some View {
        ZStack {
            Color.brown
                .ignoresSafeArea()
            
            VStack {
                
                Image("HealthPrepLogo")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
                    .clipShape(.circle)
                    .padding()
                
                Text("Health Prep")
                    .font(.title)
                    .foregroundColor(.black)
                
                
            }
        }
        
    }
    
}

#Preview {
    HomeView()
}
