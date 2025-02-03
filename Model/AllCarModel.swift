
import Foundation


struct Car: Identifiable, Codable {
    let id: String
    let car_name: String?
    let car_number: String?
    let cartype: String?
    let carimage: String?
    let seats: String?
    let transmission: String?
    let priceperday: String?
    let car_deposite: String?
    let status: String?

    enum CodingKeys: String, CodingKey {
        case id, car_name, car_number, cartype, carimage, seats, transmission, priceperday, car_deposite, status
    }
}

struct CarResponse: Codable {
    let status: Int
    let message: String
    let data: [Car]
}
