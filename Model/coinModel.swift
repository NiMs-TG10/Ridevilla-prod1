//
//  coinModel.swift
//  rv2
//
//  Created by Nishant Mehta on 12/3/24.
//

import Foundation

struct Booking {
    let id: UUID
    let customerPhoneNumber: String
    let rentalCharge: Double
    let extraKmCharge: Double
    var totalRevenue: Double {
        return rentalCharge + extraKmCharge
    }
}

class RideCoinsManager: ObservableObject {
    @Published var rideCoinsBalance: [String: Double] = [:] // Phone -> Coins
    @Published var bookings: [Booking] = []
    
    func addBooking(booking: Booking) {
        bookings.append(booking)
        let cashback = booking.rentalCharge * 0.10
        rideCoinsBalance[booking.customerPhoneNumber, default: 0] += cashback
        sendSMS(to: booking.customerPhoneNumber, message: "You earned \(cashback) RideCoins for booking!")
    }
    
    func redeemCoins(phone: String, amount: Double) -> Bool {
        guard let balance = rideCoinsBalance[phone], balance >= amount else {
            return false
        }
        rideCoinsBalance[phone]! -= amount
        sendSMS(to: phone, message: "You redeemed \(amount) RideCoins!")
        return true
    }
    
    private func sendSMS(to phone: String, message: String) {
        print("Sending SMS to \(phone): \(message)") // Replace with actual SMS API call.
    }
}
