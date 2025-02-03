import Foundation

struct CustomerResponse: Codable {
    let status: Int
    let message: String
    let data: [Customer]
}

struct Customer: Codable, Identifiable {
    let id: String
    let cusName: String
    let phone: String
    let email: String
    let address: String?
    let status: String
    let otpStatus: String
    let createAt: String
    let proof1: String?
    let proof2: String?
    let proof3: String?
    let proof4: String?
    
    // Coding keys to handle JSON field names with underscores
    enum CodingKeys: String, CodingKey {
        case id, phone, email, address, status, createAt
        case cusName = "cus_name"
        case otpStatus = "otp_status"
        case proof1, proof2, proof3, proof4
    }
}

