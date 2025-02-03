import SwiftUI

struct OTPLoginView: View {
    @State private var phoneNumber: String = ""
    @State private var isLoading: Bool = false
    @State private var successMessage: String?
    @State private var errorDescription: String?
    
    @State private var navigateToOTPVerificationView: Bool = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("Login with Phone number")
                    .font(.title)
                    .fontWeight(.bold)
                
                TextField("Enter your phone number", text: $phoneNumber)
                    .keyboardType(.numberPad)
                    .padding()
                    .background(Color(.systemGray6))
                    .cornerRadius(10)
                    .overlay(
                        RoundedRectangle(cornerRadius: 10)
                            .stroke(Color.gray, lineWidth: 1)
                    )
//                NavigationLink(destination: OTPVerificationView()) {
//                    Text("Go to Detail")
//                }
                
                NavigationLink(
                    destination: OTPVerificationView(),
                    isActive: $navigateToOTPVerificationView
                                ) {
                                    EmptyView()
                                }

                
                if isLoading {
                    ProgressView()
                } else {
                    Button(action: {
                        sendOTPRequest()
                        navigateToOTPVerificationView = true
                        
                        
                    }) {
                        Text("Send OTP")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Color.blue)
                            .cornerRadius(10)
                    }
                    .disabled(phoneNumber.isEmpty || phoneNumber.count < 10)
                }
                
       
                    
                
                
                if let successMessage = successMessage {
                    Text(successMessage)
                        .foregroundColor(.green)
                }
                
                if let errorDescription = errorDescription {
                    Text(errorDescription)
                        .foregroundColor(.red)
                        .font(.caption)
                        .multilineTextAlignment(.center)
                }
                
                Spacer()
            }
            .padding()
        }
    }
    
    func sendOTPRequest() {
        guard !phoneNumber.isEmpty, phoneNumber.count >= 10 else {
            errorDescription = "Invalid phone number. Ensure it has at least 10 digits."
            return	
        }
        
        let url = URL(string: "https://ridevilla.in/api/V2/Restapi/loginWithOtp")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let body: [String: Any] = [
            "mobile_number": phoneNumber
        ]
        
        do {
            request.httpBody = try JSONSerialization.data(withJSONObject: body, options: [])
        } catch {
            errorDescription = "Request encoding failed: \(error.localizedDescription)"
            return
        }
        
        isLoading = true
        successMessage = nil
        errorDescription = nil
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            DispatchQueue.main.async {
                isLoading = false
                
                if let error = error {
                    errorDescription = "Network error: \(error.localizedDescription)"
                    return
                }
                
                guard let httpResponse = response as? HTTPURLResponse else {
                    errorDescription = "Invalid response from server."
                    return
                }
                
                if httpResponse.statusCode == 200 {
                    successMessage = "OTP sent successfully! Please check your phone."
                } else {
                    // Assuming the API may return additional error details in the response body.
                    if let data = data,
                       let errorResponse = try? JSONSerialization.jsonObject(with: data, options: []) as? [String: Any],
                       let serverMessage = errorResponse["message"] as? String {
                        errorDescription = "Server error: \(serverMessage)"
                    } else {
                        errorDescription = "HTTP Error: \(httpResponse.statusCode). Unable to send OTP."
                    }
                }
            }
        }.resume()
    }
}

struct OTPLoginView_Previews: PreviewProvider {
    static var previews: some View {
        OTPLoginView()
    }
}
