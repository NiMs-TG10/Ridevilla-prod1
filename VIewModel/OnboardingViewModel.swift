//
//  OnboardingViewModel.swift
//  rv2
//
//  Created by Nishant Mehta on 2/4/25.
//

import Foundation
import SwiftUI

class OnboardingViewModel: ObservableObject {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
}
