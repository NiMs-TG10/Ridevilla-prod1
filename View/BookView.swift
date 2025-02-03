

import SwiftUI



struct BookView: View {
    @State private var showImportantInfo = false
    @State private var redeemCoins = false
    @State private var rideCoinsBalance: Double = 1000.0 // Hardcoded RideCoins balance
    @State private var redeemAmount: Double = 0.0
    @State private var totalAmount: Double = 22786.0
    
    
    //------
    @State private var isToggled: Bool = false
    @State private var showDetails: Bool = false
    @State private var isRedeemed: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    // Title
                    Text("Checkout")
                        .font(.largeTitle)
                        .padding(.bottom, 20)
                    
                    // Booking Details Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Your Order")
                            .font(.headline)
                        
                        HStack {
                            Image("T") // Replace with your car image
                                .resizable()
                                .frame(width: 120, height: 100)
                                .cornerRadius(10)
                            
                            VStack(alignment: .leading) {
                                Text("Mahindra Thar")
                                    .font(.headline)
                                
                                HStack {
                                    Text("Manual")
                                    Spacer()
                                    Text("Petrol Car")
                                    Spacer()
                                    Text("7 seats")
                                }
                                .font(.subheadline)
                            }
                        }
                        
                        HStack {
                            VStack(alignment: .leading) {
                                Text("08-10-2024, 10:00 AM")
                                Text("18-10-2024, 11:00 AM")
                            }
                            Spacer()
                            Text("₹20,786")
                                .font(.title2)
                                .bold()
                        }
                        
                        Text("City Name: Ahmedabad")
                            .foregroundColor(.gray)
                        
                        Divider()
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    
                    // Redeem RideCoins Section
                    VStack(alignment: .leading, spacing: 10) {
                        
                        
                        
                        Text("Redeem RideCoins")
                            .font(.headline)
                        
                        Text("You can redeem up to 50% of the total rental charges (excluding deposit).")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        // Toggle Button with Animation
                        HStack {
                            Text("Redeem Coins")
                                .font(.headline)
                            Spacer()
                            AnimatedToggle(isOn: $redeemCoins)
                        }
                        .padding(.vertical, 10)
                        
                        if redeemCoins {
                            VStack(spacing: 10) {
                                HStack {
                                    Text("Redeemed Coins")
                                    Spacer()
                                    Text("\(Int(redeemAmount)) RC")
                                        .font(.headline)
                                }
                                
                                HStack {
                                    Text("After Redemption")
                                    Spacer()
                                    Text("₹\(Int(totalAmount))")
                                        .font(.headline)
                                }
                            }
                            .padding()
                            .background(Color(.secondarySystemBackground))
                            .cornerRadius(10)
                            .transition(.opacity)
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.bottom, 20)
                    
                    // Important Points
                    Button(action: {
                 
                        showImportantInfo.toggle()
                    }) {
                        HStack {
                            Text("Vehicle Rental Terms and Conditions")
                                .font(.headline)
                            Spacer()
                            Image(systemName: showImportantInfo ? "chevron.up" : "chevron.down")
                        }
                    }
                    .padding(.vertical, 10)
                    
                    if showImportantInfo {
                        VStack(alignment: .leading, spacing: 15) {
                            Text("Additional Charges")
                                .font(.title)
                            Text("Tolls, Inter-state Taxes & Parking:")
                            Text("To be paid by you. These charges will be deducted from your security deposit.")
                            
                            Text("Fuel:")
                            Text("You will get vehicle with the fixed amount of fuel in the tank. You should also return the vehicle with the same amount.")
                            
                            Text("Speed Limit:")
                            Text("Maximum speed limit is 120 kms/hr. Exceeding it may incur penalties starting from Rs. 500.")
                            
                            Text("ID Verification:")
                            Text("Our executive will contact you for ID verification after booking confirmation.")
                        }
                        .padding()
                        .background(Color(.secondarySystemBackground))
                        .cornerRadius(10)
                    }
                    
                    // Total Section
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Total")
                            .font(.headline)
                        
                        HStack {
                            Text("Refundable Deposit")
                            Spacer()
                            Text("₹2000")
                        }
                        
                        HStack {
                            Text("Kms limit")
                            Spacer()
                            Text("3013 kms")
                        }
                        
                        HStack {
                            Text("Fuel")
                            Spacer()
                            Text("Excluded")
                        }
                        
                        HStack {
                            Text("Extra kms charge")
                            Spacer()
                            Text("₹8/km")
                        }
                        
                        HStack {
                            Text("Tolls, Parking & Inter-state taxes")
                            Spacer()
                            Text("To be paid by you")
                        }
                        
                        HStack {
                            Text("Total")
                                .font(.title2)
                                .bold()
                            Spacer()
                            Text("₹\(Int(totalAmount))")
                                .font(.title2)
                                .bold()
                        }
                    }
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .padding(.top, 20)
                    
                    // Button for Reserve
                    Button(action: {
                        // Reserve action here
                    }) {
                        Text("Reserve ₹500")
                            .font(.headline)
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding(.top, 20)
                    
                    Spacer()
                }
                .padding()
            }
            .navigationTitle("Car Booking")
        }
    }
    
    private func calculateRedemption() {
        let maxRedeemableCoins = min(rideCoinsBalance, totalAmount * 0.50)
        rideCoinsBalance -= maxRedeemableCoins
        redeemAmount = maxRedeemableCoins
        totalAmount -= maxRedeemableCoins
    }
    
    private func resetRedemption() {
        rideCoinsBalance += redeemAmount
        totalAmount += redeemAmount
        redeemAmount = 0.0
    }
}

struct AnimatedToggle: View {
    @Binding var isOn: Bool
    
    var body: some View {
        HStack {
            Circle()
                .foregroundColor(isOn ? .green : .gray)
                .frame(width: 20, height: 20)
                .offset(x: isOn ? 20 : -20)
                .animation(.spring(response: 0.4, dampingFraction: 0.6), value: isOn)
        }
        .onTapGesture {
            isOn.toggle()
        }
        .frame(width: 50, height: 25)
        .background(isOn ? Color.green.opacity(0.3) : Color.gray.opacity(0.3))
        .cornerRadius(12.5)
    }
}

#Preview {
    BookView()
}






