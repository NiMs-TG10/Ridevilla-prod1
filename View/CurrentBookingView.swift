import SwiftUI

struct CurrentBookingView: View {
    @State private var showExtendBooking = false
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                // Current booking card
                VStack(alignment: .leading, spacing: 15) {
                    Text("Current Booking")
                        .font(.headline)
                    
                    HStack {
                        Image("T")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .cornerRadius(10)
                        
                        VStack(alignment: .leading) {
                            Text("Mahindra Thar")
                                .font(.title3)
                            Text("Time Remaining: 2d 5h")
                                .foregroundColor(.orange)
                        }
                    }
                    
                    Button("Extend Booking") {
                        showExtendBooking = true
                    }
                    .buttonStyle(.borderedProminent)
                }
                .padding()
                .background(Color(.secondarySystemBackground))
                .cornerRadius(15)
                .padding()
                
                Spacer()
            }
            .navigationTitle("Current Booking")
            .sheet(isPresented: $showExtendBooking) {
                ExtendBookingView()
            }
        }
    }
}

import SwiftUI

struct ExtendBookingView: View {
    let phoneNumber = "72993 88888" // Replace with your desired phone number
    
    var body: some View {
        NavigationView {
            VStack(spacing: 20) {
                Text("Call for extention")
                    .font(.headline)
                    .padding(.top, 20)
                
                Text(phoneNumber)
                    .font(.title)
                    .bold()
                    .padding()
                    .background(Color(.secondarySystemBackground))
                    .cornerRadius(10)
                    .contextMenu {
                        Button(action: {
                            UIPasteboard.general.string = phoneNumber
                        }) {
                            Label("Copy", systemImage: "doc.on.doc")
                        }
                        Button(action: {
                            if let url = URL(string: "tel:\(phoneNumber.replacingOccurrences(of: "-", with: ""))"),
                               UIApplication.shared.canOpenURL(url) {
                                UIApplication.shared.open(url)
                            }
                        }) {
                            Label("Call", systemImage: "phone.fill")
                        }
                    }
                
                Spacer()
            }
            .padding()
            .navigationTitle("Contact Support")
        }
    }
}


#Preview {
    CurrentBookingView()
}


