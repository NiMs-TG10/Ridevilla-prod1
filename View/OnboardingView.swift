import SwiftUI

struct OnboardingView: View {
    @State private var currentPage = 0
    @ObservedObject var viewModel: OnboardingViewModel

    var body: some View {
        VStack {
            TabView(selection: $currentPage) {
                OnboardingPageView(
                    imageName: "car.fill",
                    title: "Welcome to Ridevilla",
                    description: "Find and book rental cars with ease."
                )
                .tag(0)

                OnboardingPageView(
                    imageName: "map",
                    title: "Explore Locations",
                    description: "Rent a car from various locations near you."
                )
                .tag(1)

                OnboardingPageView(
                    imageName: "creditcard.fill",
                    title: "Easy Payments",
                    description: "Pay securely with multiple payment options."
                )
                .tag(2)

                OnboardingPageView(
                    imageName: "checkmark.circle.fill",
                    title: "Ready to Ride?",
                    description: "Let's get started with Ridevilla!"
                )
                .tag(3)
            }
            .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))

            HStack {
                if currentPage < 3 {
                    Button("Skip") {
                        viewModel.hasSeenOnboarding = true
                    }
                    .padding()
                }

                Spacer()

                Button(currentPage == 3 ? "Get Started" : "Next") {
                    if currentPage < 3 {
                        withAnimation { currentPage += 1 }
                    } else {
                        viewModel.hasSeenOnboarding = true
                    }
                }
                .padding()
            }
            .padding()
        }
    }
}
//#Preview {
//    OnboardingView(viewModel:)
//}
