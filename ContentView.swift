//
//  ContentView.swift
//  rv2
//
//  Created by Nishant Mehta on 03/10/24.
//

import SwiftUI

import SwiftUI

struct ContentView: View {
    @StateObject var viewModel = OnboardingViewModel()

    var body: some View {
        if viewModel.hasSeenOnboarding {
            HomeView()  // Your main app view
        } else {
            OnboardingView(viewModel: viewModel)
        }
    }
}
#Preview {
    ContentView()
}
