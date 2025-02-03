//
//  LaunchScreenView.swift
//  rv2
//
//  Created by Nishant Mehta on 06/10/24.
//

import SwiftUI

struct LaunchScreenView: View {
    @State private var isAnimating = false
    @State private var showLoginView = false
    
    
    @State private var scale: CGFloat = 0.5
    @State private var opacity: Double = 0.0
    var body: some View {
        ZStack {
            if showLoginView {
                VehicleBookingView()
                    .transition(.move(edge: .leading))
            } else {
                Color.white.ignoresSafeArea()
                
                VStack {
//                    Text("Ridevilla")
//                        .font(.system(size: 40, weight: .bold))
//                        .foregroundColor(.blue)
//                        .opacity(isAnimating ? 1 : 0)
//                        .scaleEffect(isAnimating ? 1 : 0.5)
//                    
                    Image("RV")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 150, height: 150)
                        .scaleEffect(isAnimating ? 1 : 0.1)
                }
                .onAppear {
                    withAnimation(.spring(duration: 1.5)) {
                        isAnimating = true
                        scale = 1.0 // Final scale
                    }
                    
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
                        withAnimation(.easeInOut(duration: 0.5)) {
                            showLoginView = true
                            scale = 1.2 // Zoom in slightly
                            opacity = 0.0 // Fade out
                        }
                    }
                }
                .scaleEffect(isAnimating ? scale : 0.5) // Start from smaller scale
                .opacity(isAnimating ? 1.0 : 0.0)
//                .onAppear {
//                    withAnimation(.spring(duration: 1.5)) {
//                        isAnimating = true
//                    }
//                    
//                    DispatchQueue.main.asyncAfter(deadline: .now() + 2.0) {
//                        withAnimation {
//                            showLoginView = true
//                        }
//                    }
//                }
            }
        }
    }
}

struct LoginView: View {
    var body: some View {
        Text("Login Screen")
    }
}

#Preview {
    LaunchScreenView()
}
