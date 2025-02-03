//  LuxuryRedeemView.swift
//
//  rv2
//
//  Created by Nishant Mehta on 12/3/24.
//

import SwiftUI

struct LuxuryRedeemView: View {
    @State private var isToggled: Bool = false
    @State private var showDetails: Bool = false
    @State private var isRedeemed: Bool = false

    var body: some View {
        ZStack {
            LinearGradient(
                gradient: Gradient(colors: [Color.purple.opacity(0.8), Color.indigo]),
                startPoint: .top,
                endPoint: .bottom
            )
            .ignoresSafeArea()

            VStack(spacing: 30) {
                Text("Redeem Rewards")
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.white)

                // Toggle Switch
                HStack {
                    Text("Redeem 50% Coins")
                        .font(.title3)
                        .fontWeight(.medium)
                        .foregroundColor(.white)
                    
                    Spacer()
                    
                    Toggle("", isOn: $isToggled)
                        .toggleStyle(SwitchToggleStyle(tint: Color.yellow))
                        .onChange(of: isToggled) { newValue in
                            withAnimation(.spring()) {
                                showDetails = newValue
                            }
                        }
                }
                .padding()
                .background(Color.white.opacity(0.1))
                .cornerRadius(20)
                .padding(.horizontal)

                if showDetails {
                    VStack(spacing: 20) {
                        Text("Redemption Details")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .padding(.top)

                        // Redeemed Amount
                        HStack {
                            Text("Redeemed Amount")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            Spacer()
                            Text("$250.00")
                                .font(.title)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(15)

                        // Coins Used
                        HStack {
                            Text("Coins Used")
                                .font(.title3)
                                .fontWeight(.medium)
                                .foregroundColor(.white)
                            Spacer()
                            HStack {
                                Image(systemName: "bitcoinsign.circle.fill")
                                    .font(.title)
                                    .foregroundColor(.yellow)
                                Text("5000")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .foregroundColor(.yellow)
                            }
                        }
                        .padding()
                        .background(Color.white.opacity(0.1))
                        .cornerRadius(15)
                        
                        Button(action: {
                            withAnimation(.easeIn) {
                                isRedeemed.toggle()
                            }
                        }) {
                            Text("Redeem Now")
                                .font(.title2)
                                .fontWeight(.semibold)
                                .padding()
                                .frame(maxWidth: .infinity)
                                .background(
                                    LinearGradient(
                                        gradient: Gradient(colors: [Color.orange, Color.pink]),
                                        startPoint: .leading,
                                        endPoint: .trailing
                                    )
                                )
                                .foregroundColor(.white)
                                .cornerRadius(20)
                        }
                        .padding(.top)

                        if isRedeemed {
                            Text("Successfully Redeemed!")
                                .font(.title3)
                                .fontWeight(.bold)
                                .foregroundColor(.green)
                                .transition(.move(edge: .bottom).combined(with: .opacity))
                        }
                    }
                    .padding()
                    .background(Color.black.opacity(0.3))
                    .cornerRadius(20)
                    .padding(.horizontal)
                }
            }
        }
        .animation(.easeInOut, value: showDetails)
    }
}

//struct LuxuryRedeemView_Previews: PreviewProvider {
//    static var previews: some View {
//        LuxuryRedeemView()
//    }
//}
#Preview {
    LuxuryRedeemView()
}
