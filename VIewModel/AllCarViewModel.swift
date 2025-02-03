//
//  AllCarViewModel.swift
//  rv2
//
//  Created by Nishant Mehta on 12/12/24.
//

import Foundation


class CarViewModel: ObservableObject {
    @Published var cars: [Car] = []
    
    func fetchCars() {
        guard let url = URL(string: "https://ridevilla.in/api/V2/Restapi/getCarList") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(CarResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.cars = decodedResponse.data.filter { $0.status == "1" }
                    }
                } catch {
                    print("Decoding error: \(error)")
                }
            } else if let error = error {
                print("Network error: \(error)")
            }
        }.resume()
    }
}
