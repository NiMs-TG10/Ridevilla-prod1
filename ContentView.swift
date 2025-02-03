//
//  ContentView.swift
//  rv2
//
//  Created by Nishant Mehta on 03/10/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "car.fill")
                .imageScale(.large)
                .font(.system(size: 60))
                .foregroundColor(.blue)
            
            VStack(spacing: 10) {
                Text("Welcome to RideVilla")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.primary)
                
                Text("Experience Luxury Car Rentals")
                    .font(.title3)
                    .foregroundColor(.secondary)
            }
        }
        .padding(30)
        .background(Color.white)
        .cornerRadius(15)
        .shadow(radius: 5)
        .padding()
    }
}

#Preview {
    ContentView()
}
