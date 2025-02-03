
import SwiftUI

struct CustomerListView: View {
    @StateObject private var viewModel = CustomerViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.customers) { customer in
                VStack(alignment: .leading) {
                    Text(customer.cusName)
                        .font(.headline)
                    Text("Phone: \(customer.phone)")
                    Text("Email: \(customer.email)")
                    if let address = customer.address {
                        Text("Address: \(address)")
                    }
                    Text("Created at: \(customer.createAt)")
                        .font(.footnote)
                        .foregroundColor(.gray)
                }
            }
            .navigationTitle("Customers")
            .onAppear {
                viewModel.fetchData()
            }
        }
    }
}

#Preview {
    CustomerListView()
}
