
import SwiftUI

struct CardView: View {
    var onBookTap: () -> Void  // Pass action to handle the "Book" button tap
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            // Main card container
            ZStack(alignment: .top) {
                // Image layer
                Image("T")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 350, height: 350)  // Original size
                    .clipped()
                    .cornerRadius(20)
                    .overlay(
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.gray.opacity(0.3), lineWidth: 0.5)
                    )
                
                // Title at the top
                VStack {
                    Text("Mahindra Thar")
                        .font(.system(size: 24, weight: .medium))
                        .foregroundColor(.black)
                        .padding(.vertical, 8)
                        .padding(.horizontal, 16)
                        .padding(.top, 16)
                    
                    Spacer()
                }
            }
            
            // Bottom overlay with details
            VStack(alignment: .leading, spacing: 8) {
                // Replace the HStack here with the updated one
                HStack(alignment: .top) {
                    // "300 kms" text aligned to the left
                    Text("300 kms")
                        .lineLimit(1)
                        .font(.title2)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .alignmentGuide(.top) { _ in 0 }  // Aligns to the top
                    
                    Spacer()
                    
                    // Price section aligned to the right
                    VStack(alignment: .trailing, spacing: 2) {
                        // List Price
                        HStack(alignment: .center, spacing: 4) {
                            Text("₹7000")
                                .strikethrough()
                                .foregroundColor(.white.opacity(0.8))
                                .font(.title3)
                            
                            Text("₹5800")
                                .foregroundColor(.white)
                                .font(.title)
                                .fontWeight(.bold)
                        }
                        
                        // You Save section
                        HStack(spacing: 4) {
                            Text("55%")
                                .font(.title3)
                                .bold()
                                .foregroundColor(.green)
                                .shadow(color: Color.green.opacity(0.8), radius: 10, x: 0, y: 0)  // Bloom effect by shadow
                                .shadow(color: Color.green.opacity(0.5), radius: 15, x: 0, y: 0)
                        }
                        .font(.system(size: 12))
                    }
                }
                
                HStack(spacing: 10) { // Adjust the spacing between the labels here
                    HStack(spacing: 2) { // Reduce spacing between icon and text
                        Image(systemName: "fuelpump")
                        Text("Petrol Car")
                    }
                    
                    HStack(spacing: 2) { // Reduce spacing between icon and text
                        Image(systemName: "gearshape")
                        Text("Manual")
                    }
                    
                    HStack(spacing: 2) { // Reduce spacing between icon and text
                        Image(systemName: "person.3")
                        Text("7 Seats")
                    }
                }
                .font(.subheadline)
                .foregroundColor(.white)
                
                HStack {
                    Text("Extra km charge @ ₹14/km")
                        .font(.caption)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .background(
                Color.black.opacity(0.30)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            )
//            .padding([.leading, .bottom], 10)
            .padding([.leading, .bottom], 10)  // Original padding
            .offset(x: -5)
        }
        .frame(width: 300, height: 300) // Original card size
        .shadow(radius: 20)
    }
}

struct CardView_Preview: PreviewProvider {
    static var previews: some View {
        CardView(onBookTap: {})
    }
}//#Preview {
//    CardView(onBookTap: <#() -> Void#>)
//}
