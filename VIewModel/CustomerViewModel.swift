
import Foundation
import Combine

class CustomerViewModel: ObservableObject {
    @Published var customers: [Customer] = []
    
    func fetchData() {
        // Replace this URL with the actual endpoint
        guard let url = URL(string: "https://ridevilla.in/api/V2/Restapi/getCustomerData") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data {
                do {
                    let decodedResponse = try JSONDecoder().decode(CustomerResponse.self, from: data)
                    DispatchQueue.main.async {
                        self.customers = decodedResponse.data
                    }
                } catch {
                    print("Decoding error:", error)
                }
            }
        }.resume()
    }
}
