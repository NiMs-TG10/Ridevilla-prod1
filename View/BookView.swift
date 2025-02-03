//
//  BookView.swift
//  rv2
//
//  Created by Nishant Mehta on 03/10/24.
//

//import SwiftUI
//
//struct BookView: View {
//    var body: some View {
//        ZStack {
//            ScrollView {
//                VStack(spacing: 20) {
//                    Text("Checkout")
//                        .font(.largeTitle)
//                        .fontWeight(.bold)
//                    
//                    HStack(alignment: .top, spacing: 20) {
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("IMPORTANT POINTS TO REMEMBER")
//                                .font(.headline)
//                            
//                            VStack(alignment: .leading, spacing: 10) {
//                                Text("TOLLS, INTER-STATE TAXES & PARKING:")
//                                    .fontWeight(.bold)
//                                Text("To be paid by you. These charges will be deducted from your security deposit.")
//                                
//                                Text("FUEL:")
//                                    .fontWeight(.bold)
//                                Text("You will get vehicle with the fixed amount of fuel in the tank, you should also return the vehicle with the same amount of fuel.")
//                                
//                                Text("SPEED LIMIT:")
//                                    .fontWeight(.bold)
//                                Text("Maximum speed limit is 120 kms/Hr if this limit exeed Rs. 500 for the first incident. Rs. 1000 for repeated infraction after warning. Upon repeated over-speeding, we will be compelled to withdraw services from the User.")
//                                
//                                Text("ID VERIFICATION:")
//                                    .fontWeight(.bold)
//                                Text("For id verification our executive will contact you after booking confirmation.")
//                            }
//                            .font(.subheadline)
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                        
//                        VStack(alignment: .leading, spacing: 15) {
//                            Text("Your Order")
//                                .font(.headline)
//                            
//                            Text("Booking details")
//                                .padding(5)
//                                .background(Color.gray.opacity(0.2))
//                                .cornerRadius(5)
//                            
//                            Text("Maruti Swift (P)")
//                                .font(.title3)
//                            
//                            Image(systemName: "car.fill")
//                                .resizable()
//                                .aspectRatio(contentMode: .fit)
//                                .frame(height: 100)
//                            
//                            HStack {
//                                Image(systemName: "gearshift")
//                                Text("Manual")
//                                
//                                Image(systemName: "fuelpump")
//                                Text("Petrol Car")
//                                
//                                Image(systemName: "person.3")
//                                Text("5 seats")
//                            }
//                            
//                            VStack(alignment: .leading, spacing: 10) {
//                                HStack {
//                                    Image(systemName: "flag.fill")
//                                    Text("08-10-2024")
//                                    Text("10:00am")
//                                }
//                                HStack {
//                                    Image(systemName: "flag.fill")
//                                    Text("18-10-2024")
//                                    Text("11:00am")
//                                }
//                                Text("Kms limit: 3013 kms")
//                                Text("₹20786")
//                                    .fontWeight(.bold)
//                            }
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                            
//                            Text("City Name: Ahmedabad")
//                            
//                            VStack(alignment: .leading, spacing: 10) {
//                                HStack {
//                                    Text("Refundable Deposit")
//                                    Spacer()
//                                    Text("₹2000")
//                                }
//                                HStack {
//                                    Text("Kms limit")
//                                    Spacer()
//                                    Text("3013 kms")
//                                }
//                                HStack {
//                                    Text("Fuel")
//                                    Spacer()
//                                    Text("Excluded")
//                                }
//                                HStack {
//                                    Text("Extra kms charge")
//                                    Spacer()
//                                    Text("₹8/km")
//                                }
//                                HStack {
//                                    Text("Tolls, Parking & Inter-state taxes")
//                                    Spacer()
//                                    Text("To be paid by you")
//                                }
//                            }
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                            
//                            HStack {
//                                Text("Total")
//                                Spacer()
//                                Text("₹22786")
//                                    .fontWeight(.bold)
//                            }
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                            
//                            VStack(alignment: .leading, spacing: 10) {
//                                HStack {
//                                    Image(systemName: "checkmark.circle.fill")
//                                    Text("Self Pickup")
//                                }
//                                Text("Address: Ridevilla G3 kesar alanta near chharodi Ahmedabad 382481")
//                                    .font(.caption)
//                                
//                                Button(action: {
//                                    // Direction action
//                                }) {
//                                    Text("Direction")
//                                        .foregroundColor(.blue)
//                                }
//                            }
//                            .padding()
//                            .background(Color.gray.opacity(0.2))
//                            .cornerRadius(10)
//                        }
//                        .frame(maxWidth: .infinity, alignment: .leading)
//                    }
//                }
//                .padding()
//                .padding(.bottom, 60) // Add padding at the bottom for the fixed button
//            }
//            
//            VStack {
//                Spacer()
//                Button(action: {
//                    // Reserve action
//                }) {
//                    Text("Reserve ₹500")
//                        .foregroundColor(.white)
//                        .frame(maxWidth: .infinity)
//                        .padding()
//                        .background(Color.green)
//                        .cornerRadius(10)
//                }
//                .padding()
//            }
//        }
//    }
//}




//v2

//import SwiftUI
//
//struct BookView: View {
//    @State private var showImportantInfo = false
//    
//    var body: some View {
//        NavigationView {
//            ScrollView {
//                VStack(alignment: .leading) {
//                    // Title
//                    Text("Checkout")
//                        .font(.largeTitle)
//                        .padding(.bottom, 20)
//                    
//                    // Booking Details Section
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("Your Order")
//                            .font(.headline)
//                        
//                        HStack {
//                            Image("T") // Replace with your car image
//                                .resizable()
//                                .frame(width: 120, height: 100)
//                                .cornerRadius(10)
//                            
//                            VStack(alignment: .leading) {
//                                Text("Mahindra Thar")
//                                    .font(.headline)
//                                
//                                HStack {
//                                    Text("Manual")
//                                    Spacer()
//                                    Text("Petrol Car")
//                                    Spacer()
//                                    Text("7 seats")
//                                }
//                                .font(.subheadline)
//                            }
//                        }
//                        
//                        HStack {
//                            VStack(alignment: .leading) {
//                                Text("08-10-2024, 10:00 AM")
//                                Text("18-10-2024, 11:00 AM")
//                            }
//                            Spacer()
//                            Text("₹20,786")
//                                .font(.title2)
//                                .bold()
//                        }
//                        
//                        Text("City Name: Ahmedabad")
//                            .foregroundColor(.gray)
//                        
//                        Divider()
//                    }
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
//                    .cornerRadius(10)
//                    .padding(.bottom, 20)
//                    
//                    // Important Points
//                    Button(action: {
//                        showImportantInfo.toggle()
//                    }) {
//                        HStack {
//                            Text("Vehicle Rental Terms and Conditions")
//                                .font(.headline)
//                            Spacer()
//                            Image(systemName: showImportantInfo ? "chevron.up" : "chevron.down")
//                        }
//                    }
//                    .padding(.vertical, 10)
//                    
//                    if showImportantInfo {
//                        VStack(alignment: .leading, spacing: 15) {
//                            Text("Additional Charges")
//                                .font(.title)
//                            Text("Tolls, Inter-state Taxes & Parking:")
//                            Text("To be paid by you. These charges will be deducted from your security deposit.")
//                            
//                            Text("Fuel:")
//                            Text("You will get vehicle with the fixed amount of fuel in the tank. You should also return the vehicle with the same amount.")
//                            
//                            Text("Speed Limit:")
//                            Text("Maximum speed limit is 120 kms/hr. Exceeding it may incur penalties starting from Rs. 500.")
//                            
//                            Text("ID Verification:")
//                            Text("Our executive will contact you for ID verification after booking confirmation.")
//                        }
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//                        .cornerRadius(10)
//                    }
//                    
//                    // Total Section
//                    VStack(alignment: .leading, spacing: 10) {
//                        Text("Total")
//                            .font(.headline)
//                        
//                        HStack {
//                            Text("Refundable Deposit")
//                            Spacer()
//                            Text("₹2000")
//                        }
//                        
//                        HStack {
//                            Text("Kms limit")
//                            Spacer()
//                            Text("3013 kms")
//                        }
//                        
//                        HStack {
//                            Text("Fuel")
//                            Spacer()
//                            Text("Excluded")
//                        }
//                        
//                        HStack {
//                            Text("Extra kms charge")
//                            Spacer()
//                            Text("₹8/km")
//                        }
//                        
//                        HStack {
//                            Text("Tolls, Parking & Inter-state taxes")
//                            Spacer()
//                            Text("To be paid by you")
//                        }
//                        
//                        HStack {
//                            Text("Total")
//                                .font(.title2)
//                                .bold()
//                            Spacer()
//                            Text("₹22,786")
//                                .font(.title2)
//                                .bold()
//                        }
//                    }
//                    .padding()
//                    .background(Color(.secondarySystemBackground))
//                    .cornerRadius(10)
//                    .padding(.top, 20)
//                    
//                    // Button for Reserve
//                    Button(action: {
//                        // Reserve action here
//                    }) {
//                        Text("Reserve ₹500")
//                            .font(.headline)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                    }
//                    .padding(.top, 20)
//                    
//                    Spacer()
//                }
//                .padding()
//            }
//            .navigationTitle("Car Booking")
//        }
//    }
//}
//rv2 to here


import SwiftUI

//import SwiftUI

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
//struct BookingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BookingView()
//    }
//}
#Preview {
    BookView()
}






//Sticky reseve button/
//import SwiftUI
//
//struct BookView: View {
//    @State private var showImportantInfo = false
//    
//    var body: some View {
//        NavigationView {
//            ZStack {
//                ScrollView {
//                    VStack(alignment: .leading) {
//                        // Title
//                        Text("Checkout")
//                            .font(.largeTitle)
//                            .padding(.bottom, 20)
//                        
//                        // Booking Details Section
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Your Order")
//                                .font(.headline)
//                            
//                            HStack {
//                                Image("T") // Replace with your car image
//                                    .resizable()
//                                    .frame(width: 120, height: 100)
//                                    .cornerRadius(10)
//                                
//                                VStack(alignment: .leading) {
//                                    Text("Mahindra Thar")
//                                        .font(.headline)
//                                    
//                                    HStack {
//                                        Text("Manual")
//                                        Spacer()
//                                        Text("Petrol Car")
//                                        Spacer()
//                                        Text("7 seats")
//                                    }
//                                    .font(.subheadline)
//                                }
//                            }
//                            
//                            HStack {
//                                VStack(alignment: .leading) {
//                                    Text("08-10-2024, 10:00 AM")
//                                    Text("18-10-2024, 11:00 AM")
//                                }
//                                Spacer()
//                                Text("₹20,786")
//                                    .font(.title2)
//                                    .bold()
//                            }
//                            
//                            Text("City Name: Ahmedabad")
//                                .foregroundColor(.gray)
//                            
//                            Divider()
//                        }
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//                        .cornerRadius(10)
//                        .padding(.bottom, 20)
//                        
//                        // Important Points
//                        Button(action: {
//                            showImportantInfo.toggle()
//                        }) {
//                            HStack {
//                                Text("Vehicle Rental Terms and Conditions")
//                                    .font(.headline)
//                                Spacer()
//                                Image(systemName: showImportantInfo ? "chevron.up" : "chevron.down")
//                            }
//                        }
//                        .padding(.vertical, 10)
//                        
//                        if showImportantInfo {
//                            VStack(alignment: .leading, spacing: 15) {
//                                Text("Additional Charges")
//                                    .font(.title)
//                                Text("Tolls, Inter-state Taxes & Parking:")
//                                Text("To be paid by you. These charges will be deducted from your security deposit.")
//                                
//                                Text("Fuel:")
//                                Text("You will get vehicle with the fixed amount of fuel in the tank. You should also return the vehicle with the same amount.")
//                                
//                                Text("Speed Limit:")
//                                Text("Maximum speed limit is 120 kms/hr. Exceeding it may incur penalties starting from Rs. 500.")
//                                
//                                Text("ID Verification:")
//                                Text("Our executive will contact you for ID verification after booking confirmation.")
//                            }
//                            .padding()
//                            .background(Color(.secondarySystemBackground))
//                            .cornerRadius(10)
//                        }
//                        
//                        // Total Section
//                        VStack(alignment: .leading, spacing: 10) {
//                            Text("Total")
//                                .font(.headline)
//                            
//                            HStack {
//                                Text("Refundable Deposit")
//                                Spacer()
//                                Text("₹2000")
//                            }
//                            
//                            HStack {
//                                Text("Kms limit")
//                                Spacer()
//                                Text("3013 kms")
//                            }
//                            
//                            HStack {
//                                Text("Fuel")
//                                Spacer()
//                                Text("Excluded")
//                            }
//                            
//                            HStack {
//                                Text("Extra kms charge")
//                                Spacer()
//                                Text("₹8/km")
//                            }
//                            
//                            HStack {
//                                Text("Tolls, Parking & Inter-state taxes")
//                                Spacer()
//                                Text("To be paid by you")
//                            }
//                            
//                            HStack {
//                                Text("Total")
//                                    .font(.title2)
//                                    .bold()
//                                Spacer()
//                                Text("₹22,786")
//                                    .font(.title2)
//                                    .bold()
//                            }
//                        }
//                        .padding()
//                        .background(Color(.secondarySystemBackground))
//                        .cornerRadius(10)
//                        .padding(.top, 20)
//                        
//                        Spacer(minLength: 100) // Spacer for padding above the sticky button
//                    }
//                    .padding()
//                }
//                
//                // Sticky Reserve Button
//                VStack {
//                    Spacer()
//                    Button(action: {
//                        // Reserve action here
//                    }) {
//                        Text("Reserve ₹500")
//                            .font(.headline)
//                            .frame(maxWidth: .infinity)
//                            .padding()
//                            .background(Color.blue)
//                            .foregroundColor(.white)
//                            .cornerRadius(10)
//                            .shadow(radius: 5)
//                            .padding(.horizontal)
//                    }
//                }
//                .edgesIgnoringSafeArea(.bottom) // Ensure it stays visible even at the edge
//            }
//            .navigationTitle("Car Booking")
//        }
//    }
//}
//
//#Preview {
//    BookView()
//}
