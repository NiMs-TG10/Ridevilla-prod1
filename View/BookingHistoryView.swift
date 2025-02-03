import SwiftUI

struct BookingHistoryView: View {
    var body: some View {
        NavigationView {
            List {
                ForEach(0..<5) { _ in
                    VStack(alignment: .leading, spacing: 10) {
                        Text("Mahindra Thar")
                            .font(.headline)
                        
                        Text("Oct 8, 2024 - Oct 18, 2024")
                            .font(.subheadline)
                            .foregroundColor(.gray)
                        
                        Text("₹20,786")
                            .font(.title3)
                            .foregroundColor(.green)
                    }
                    .padding(.vertical, 8)
                }
            }
            .navigationTitle("Booking History")
        }
    }
} 