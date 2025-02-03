//
//  CarListView.swift
//  rv2
//
//  Created by Nishant Mehta on 12/12/24.
//

import SwiftUI


struct CarListView: View {
    @StateObject private var viewModel = CarViewModel()
    
    var body: some View {
        NavigationView {
            List(viewModel.cars) { car in
                HStack {
                    AsyncImage(url: URL(string: "https://ridevilla.in/uploads/carimages/\(car.carimage)")) { image in
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 60)
                            .cornerRadius(8)
                    } placeholder: {
                        ProgressView()
                    }
                    
                    VStack(alignment: .leading) {
                        Text(car.car_name)
                            .font(.headline)
                        Text("Seats: \(car.seats)")
                            .font(.subheadline)
                        Text("₹\(car.priceperday)/day")
                            .font(.subheadline)
                            .foregroundColor(.green)
                    }
                }
                .padding()
            }
            .navigationTitle("Available Cars")
            .onAppear {
                viewModel.fetchCars()
                
            }
        }
    }
}
struct CarListView_Previews: PreviewProvider {
    static var previews: some View {
        CarListView()
    }
}
//#Preview {
//    CarListView()
//}
