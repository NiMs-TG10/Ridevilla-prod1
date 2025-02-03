import SwiftUI

//struct VehicleListView: View {
//    var city: String
//    var startDate: Date
//    var startHour: Int
//    var endDate: Date
//    var endHour: Int
//    @State private var hideHeader = false
//    @State private var scrollOffset: CGFloat = 0
//    @Environment(\.presentationMode) var presentationMode
//    
//    var body: some View {
//        ZStack(alignment: .top) {
//            // Beautiful gradient background
//            LinearGradient(
//                gradient: Gradient(colors: [
//                    Color(hex: "F6F8FF"),
//                    Color(hex: "E8EDFF"),
//                    Color(hex: "DCE4FF")
//                ]),
//                startPoint: .topLeading,
//                endPoint: .bottomTrailing
//            )
//            .ignoresSafeArea()
//            
//            // Decorative background patterns
//            ZStack {
//                // Top circle
//                Circle()
//                    .fill(
//                        LinearGradient(
//                            gradient: Gradient(colors: [
//                                Color(hex: "6E8EFF").opacity(0.1),
//                                Color(hex: "A5BDFF").opacity(0.05)
//                            ]),
//                            startPoint: .topLeading,
//                            endPoint: .bottomTrailing
//                        )
//                    )
//                    .frame(width: 300, height: 300)
//                    .position(x: UIScreen.main.bounds.width + 50, y: -50)
//                    .blur(radius: 20)
//                
//                // Bottom circle
//                Circle()
//                    .fill(
//                        LinearGradient(
//                            gradient: Gradient(colors: [
//                                Color(hex: "FFB6B6").opacity(0.1),
//                                Color(hex: "FF8989").opacity(0.05)
//                            ]),
//                            startPoint: .topLeading,
//                            endPoint: .bottomTrailing
//                        )
//                    )
//                    .frame(width: 250, height: 250)
//                    .position(x: -50, y: UIScreen.main.bounds.height - 100)
//                    .blur(radius: 20)
//            }
//            
//            ScrollView {
//                GeometryReader { geometry in
//                    Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin.y)
//                }
//                .frame(height: 0)
//                
//                VStack(spacing: 15) {
//                    if !hideHeader {
//                        VStack {
//                            Text("Available Cars in \(city)")
//                                .font(.title)
//                                .fontWeight(.bold)
//                                .padding(.top)
//                                .foregroundColor(Color(hex: "1A1A1A"))
//                            
//                            VStack(spacing: 8) {
//                                Text("Start: \(startDate, formatter: dateFormatter), \(startHour)h")
//                                Text("End: \(endDate, formatter: dateFormatter), \(endHour)h")
//                            }
//                            .foregroundColor(Color(hex: "666666"))
//                        }
//                        .padding(.bottom)
////                        .background(
////                            RoundedRectangle(cornerRadius: 20)
////                                .fill(Color.white.opacity(0.7))
////                                .shadow(color: Color.black.opacity(0.05), radius: 10, x: 0, y: 5)
////                        )
//                        .padding(.horizontal)
//                        .transition(.opacity)
//                    }
//                    
//                    ForEach(0..<10) { index in
//                        CardView()
////                            .frame(maxWidth: .infinity)
//                            .frame(height: 400)
////                            .background(
////                                RoundedRectangle(cornerRadius: 15)
////                                    .fill(Color.white.opacity(0.9))
////                                    .shadow(color: Color.black.opacity(0.1), radius: 15, x: 0, y: 5)
////                            )
//                            .padding(.horizontal)
//                    }
//                }
//                .padding(.top, hideHeader ? 0 : 16)
//            }
//            .coordinateSpace(name: "scroll")
//            .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
//                withAnimation(.easeInOut(duration: 0.2)) {
//                    hideHeader = value < -20
//                }
//            }
//            .ignoresSafeArea(edges: hideHeader ? .all : .bottom)
//            
//            // Custom back button overlay
//            if !hideHeader {
//                Button(action: {
//                    presentationMode.wrappedValue.dismiss()
//                }) {
//                    HStack {
//                        Image(systemName: "chevron.left")
//                        Text("Back")
//                    }
//                    .foregroundColor(Color(hex: "4A6AFF"))
//                    .padding(.horizontal, 16)
//                    .padding(.vertical, 12)
//                    .background(
//                        RoundedRectangle(cornerRadius: 12)
//                            .fill(Color.white.opacity(0.9))
//                            .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
//                    )
//                }
//                .transition(.opacity)
//                .position(x: 60, y: 20)
//            }
//        }
//        .navigationBarHidden(true)
//    }
//}
//
struct VehicleListView: View {
    var city: String
    var startDate: Date
    var startHour: Int
    var endDate: Date
    var endHour: Int
    @State private var hideHeader = false
    @State private var scrollOffset: CGFloat = 0
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        NavigationStack {
            ZStack(alignment: .top) {
                // Your existing code for gradient and patterns
                LinearGradient(
                                gradient: Gradient(colors: [
                                    Color(hex: "E0EAFC"),
                                    Color(hex: "CFDEF3")
                                ]),
                                startPoint: .topLeading,
                                endPoint: .bottomTrailing
                            )
                            .ignoresSafeArea()
                
                ScrollView {
                    GeometryReader { geometry in
                        Color.clear.preference(key: ScrollOffsetPreferenceKey.self, value: geometry.frame(in: .named("scroll")).origin.y)
                    }
                    .frame(height: 0)
                    
                    VStack(spacing: 15) {
                        if !hideHeader {
                            VStack {
                                Text("Available Cars in \(city)")
                                    .font(.title)
                                    .fontWeight(.bold)
                                    .padding(.top)
                                    .foregroundColor(Color(hex: "1A1A1A"))
                                
                                VStack(spacing: 8) {
                                    Text("Start: \(startDate, formatter: dateFormatter), \(startHour)h")
                                    Text("End: \(endDate, formatter: dateFormatter), \(endHour)h")
                                }
                                .foregroundColor(Color(hex: "666666"))
                            }
                            .padding(.bottom)
                            .padding(.horizontal)
                            .transition(.opacity)
                        }
                        
                        ForEach(0..<10) { index in
                            // NavigationLink wraps CardView for proper navigation
                            NavigationLink(destination: BookView()) {
                                CardView {
                                    // Book button action will navigate to BookView
                                    print("Navigating to BookView")  // Debugging print statement
                                }
                                .frame(height: 400)
                                .padding(.horizontal)
                            }
                        }
                    }
                    .padding(.top, hideHeader ? 0 : 16)
                }
                .coordinateSpace(name: "scroll")
                .onPreferenceChange(ScrollOffsetPreferenceKey.self) { value in
                    withAnimation(.easeInOut(duration: 0.2)) {
                        hideHeader = value < -20
                    }
                }
                .ignoresSafeArea(edges: hideHeader ? .all : .bottom)
                
                // Custom back button overlay
                if !hideHeader {
                    Button(action: {
                        presentationMode.wrappedValue.dismiss()
                    }) {
                        HStack {
                            Image(systemName: "chevron.left")
//                            Text("Back")
                        }
                        .foregroundColor(Color(hex: "4A6AFF"))
                        .padding(.horizontal, 16)
                        .padding(.vertical, 12)
                        .background(
                            RoundedRectangle(cornerRadius: 12)
                                .fill(Color.white.opacity(0.9))
                                .shadow(color: Color.black.opacity(0.1), radius: 5, x: 0, y: 2)
                        )
                    }
                    .transition(.opacity)
                    .position(x: 60, y: 20)
                }
            }
            .navigationBarHidden(true)
        }
    }
}
// Extension for hex colors
extension Color {
    init(hex: String) {
        let hex = hex.trimmingCharacters(in: CharacterSet.alphanumerics.inverted)
        var int: UInt64 = 0
        Scanner(string: hex).scanHexInt64(&int)
        let a, r, g, b: UInt64
        switch hex.count {
        case 3: // RGB (12-bit)
            (a, r, g, b) = (255, (int >> 8) * 17, (int >> 4 & 0xF) * 17, (int & 0xF) * 17)
        case 6: // RGB (24-bit)
            (a, r, g, b) = (255, int >> 16, int >> 8 & 0xFF, int & 0xFF)
        case 8: // ARGB (32-bit)
            (a, r, g, b) = (int >> 24, int >> 16 & 0xFF, int >> 8 & 0xFF, int & 0xFF)
        default:
            (a, r, g, b) = (255, 0, 0, 0)
        }
        self.init(
            .sRGB,
            red: Double(r) / 255,
            green: Double(g) / 255,
            blue:  Double(b) / 255,
            opacity: Double(a) / 255
        )
    }
}

struct ScrollOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

let dateFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .medium
    return formatter
}()
//struct ScrollOffsetPreferenceKey: PreferenceKey {
//    static var defaultValue: CGFloat = 0
//    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
//        value = nextValue()
//    }
//}
//
//let dateFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .medium
//    return formatter
//}()
// Main View with form and button to navigate
struct VehicleBookingView: View {
    @State private var selectedCity = "Ahmedabad"
    @State private var startDate = Date()
    @State private var selectedStartHour = 0
    @State private var endDate = Date()
    @State private var selectedEndHour = 0
    
    // Hour options for the picker
    let hours = Array(0...23) // Only hours from 0 to 23
    
    var body: some View {
        NavigationView {
            ZStack {
                TabView {
                    
                    Tab("Received", systemImage: "house") {
//                        NavigationLink("go", destination:MapView())	
                    }
                    .badge(2)


                    Tab("Sent", systemImage: "tray.and.arrow.up.fill") {
//                        MapView()
                    }
                    .badge(3)


                    Tab("Account", systemImage: "person.crop.circle.fill") {
//                        AccountView()
                    }
                    .badge("!")
                }
               
//                .tabViewStyle(PageTabViewStyle(indexDisplayMode: .always))


                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]), startPoint: .top, endPoint: .bottom)
                    .edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 20) {
                    Text("Check Available Cars")
                        .font(.system(size: 28, weight: .bold))
                        .foregroundColor(.white)
                        .padding(.top, 40)
                    
                    Spacer().frame(height: 20)
                    
                    // Form container with card-like appearance
                    VStack(spacing: 16) {
                        // City Picker
                        VStack(alignment: .leading, spacing: 4) {
                            Text("City")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            Picker("Select City", selection: $selectedCity) {
                                Text("Ahmedabad").tag("Ahmedabad")
                                Text("Gandhinagar").tag("Gandhinagar")
                            }
                            .pickerStyle(MenuPickerStyle())
                            .padding()
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                        
                        // Start Date & Time Fields
                        VStack(alignment: .leading, spacing: 4) {
                            Text("Start Date & Time")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            DatePicker("Start Date", selection: $startDate, displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(CompactDatePickerStyle())
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 5)
                            
                            // Start Hour Picker (No minutes)
                            Picker("Select Start Hour", selection: $selectedStartHour) {
                                ForEach(hours, id: \.self) { hour in
                                    Text("\(hour)h").tag(hour)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(height: 100)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                        
                        // End Date & Time Fields
                        VStack(alignment: .leading, spacing: 4) {
                            Text("End Date & Time")
                                .font(.headline)
                                .foregroundColor(.gray)
                            
                            DatePicker("End Date", selection: $endDate, displayedComponents: .date)
                                .labelsHidden()
                                .datePickerStyle(CompactDatePickerStyle())
                                .background(Color.white.opacity(0.9))
                                .cornerRadius(10)
                                .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 5)
                            
                            // End Hour Picker (No minutes)
                            Picker("Select End Hour", selection: $selectedEndHour) {
                                ForEach(hours, id: \.self) { hour in
                                    Text("\(hour)h").tag(hour)
                                }
                            }
                            .pickerStyle(WheelPickerStyle())
                            .frame(height: 100)
                            .background(Color.white.opacity(0.9))
                            .cornerRadius(10)
                            .shadow(color: Color.gray.opacity(0.3), radius: 5, x: 0, y: 5)
                        }
                        
                        // NavigationLink instead of Button to navigate to the new view
                        NavigationLink(
                            destination: VehicleListView(city: selectedCity, startDate: startDate, startHour: selectedStartHour, endDate: endDate, endHour: selectedEndHour)) {
                            Text("Find A Vehicle")
                                .font(.headline)
                                .foregroundColor(.white)
                                .frame(width: UIScreen.main.bounds.width - 80, height: 50)
                                .background(LinearGradient(gradient: Gradient(colors: [Color.green, Color.teal]), startPoint: .leading, endPoint: .trailing))
                                .cornerRadius(12)
                                .shadow(color: Color.black.opacity(0.2), radius: 10, x: 0, y: 10)
                                .padding(.top, 10)
                        }
                    }
                    .padding(20)
                    .background(Color.white.opacity(0.9))
                    .cornerRadius(20)
                    .shadow(color: Color.gray.opacity(0.3), radius: 20, x: 0, y: 10)
                    .padding(.horizontal, 20)
                    
                    Spacer()
                }

            }
        }
    }
}

struct VehicleBookingView_Previews: PreviewProvider {
    static var previews: some View {
        VehicleBookingView()
    }
}
