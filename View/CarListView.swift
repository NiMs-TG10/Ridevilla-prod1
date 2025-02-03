
import SwiftUI


struct CarListView: View {
    @StateObject private var viewModel = CarViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.cars) { car in
                HStack {
                    
                    AsyncImage(url: URL(string: "https://ridevilla.in/uploads/carimages/\(car.carimage ?? "T")")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 60)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        
                        Text(car.car_name ?? "Unknown car")
                            .font(.headline)
                        Text("Seats: \(car.seats ?? "2")" )
                            .font(.subheadline)
                        Text("₹\(car.priceperday ?? "2300")/day")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                }
                .padding()
                
            }
            .navigationTitle("Available Cars")
            .onAppear {
                viewModel.fetchCars()
                print(viewModel.cars) 
                
            }
        }
    }
}

#Preview {
    CarListView()
}
