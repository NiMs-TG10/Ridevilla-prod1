////
////  LuxuriousOTPVerificationView.swift
////  rv2
////
////  Created by Nishant Mehta on 1/12/25.
////
//
//
//import SwiftUI
//
//struct LuxuriousOTPVerificationView: View {
//    @State private var otpFields: [String] = Array(repeating: "", count: 4)
//    @FocusState private var focusedField: Int?
//    @State private var isResending: Bool = false
//    @State private var isVerifying: Bool = false
//    @State private var errorMessage: String?
//    @State private var userId: String = "12345" // Mock `userId`
//    @State private var navigateToVehicleBooking: Bool = false // For navigation
//
//    var body: some View {
//        NavigationStack {
//            ZStack {
//                // Background Gradient
//                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.3), Color.purple.opacity(0.4)]),
//                               startPoint: .topLeading,
//                               endPoint: .bottomTrailing)
//                    .ignoresSafeArea()
//
//                VStack(spacing: 30) {
//                    // Title
//                    Text("Verify Phone")
//                        .font(.system(size: 28, weight: .bold, design: .rounded))
//                        .foregroundColor(.white)
//                        .padding(.top, 40)
//
//                    // Subtitle
//                    Text("Code has been sent to +6281375112234")
//                        .font(.system(size: 16, weight: .medium))
//                        .foregroundColor(Color.white.opacity(0.8))
//
//                    // OTP Input Boxes
//                    HStack(spacing: 15) {
//                        ForEach(0..<4, id: \.self) { index in
//                            ZStack {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(otpFields[index].isEmpty ? Color.white.opacity(0.1) : Color.white.opacity(0.2))
//                                    .animation(.easeInOut(duration: 0.2), value: otpFields[index])
//                                    .frame(width: 60, height: 60)
//
//                                TextField("", text: $otpFields[index])
//                                    .keyboardType(.numberPad)
//                                    .focused($focusedField, equals: index)
//                                    .multilineTextAlignment(.center)
//                                    .font(.system(size: 24, weight: .bold))
//                                    .foregroundColor(.white)
//                                    .onChange(of: otpFields[index]) { _ in
//                                        handleOTPInput(at: index)
//                                    }
//                                    .frame(width: 60, height: 60)
//                            }
//                            .background(
//                                RoundedRectangle(cornerRadius: 10)
//                                    .stroke(Color.white.opacity(focusedField == index ? 1 : 0.2), lineWidth: 2)
//                            )
//                            .animation(.easeInOut(duration: 0.2), value: focusedField)
//                        }
//                    }
//
//                    // Resend Code Button
//                    if isResending {
//                        ProgressView()
//                            .tint(.white)
//                    } else {
//                        Button(action: resendCode) {
//                            Text("Didn't get OTP Code? Resend Code")
//                                .font(.system(size: 14, weight: .medium))
//                                .foregroundColor(.white)
//                                .underline()
//                        }
//                    }
//
//                    // Verify Button
//                    Button(action: verifyOTP) {
//                        ZStack {
//                            if isVerifying {
//                                ProgressView()
//                                    .tint(.white)
//                            } else {
//                                Text("Verify")
//                                    .font(.headline)
//                                    .foregroundColor(.white)
//                                    .padding()
//                                    .frame(maxWidth: .infinity)
//                            }
//                        }
//                    }
//                    .padding()
//                    .background(isOTPValid() ? Color.purple : Color.gray.opacity(0.5))
//                    .cornerRadius(12)
//                    .disabled(!isOTPValid())
//
//                    // Error Message
//                    if let errorMessage = errorMessage {
//                        Text(errorMessage)
//                            .foregroundColor(.red)
//                            .font(.caption)
//                            .multilineTextAlignment(.center)
//                            .padding(.top, 10)
//                    }
//
//                    Spacer()
//                }
//                .padding(.horizontal, 20)
//            }
//            .onAppear {
//                focusedField = 0
//            }
//            // Navigation Destination
//            .navigationDestination(isPresented: $navigateToVehicleBooking) {
//                VehicleBookingView()
//            }
//        }
//    }
//
//    // MARK: - Helper Functions
//    private func isOTPValid() -> Bool {
//        otpFields.allSatisfy { $0.count == 1 }
//    }
//
//    private func handleOTPInput(at index: Int) {
//        if otpFields[index].count > 1 {
//            otpFields[index] = String(otpFields[index].prefix(1))
//        }
//        if !otpFields[index].isEmpty && index < otpFields.count - 1 {
//            focusedField = index + 1
//        } else if otpFields[index].isEmpty && index > 0 {
//            focusedField = index - 1
//        }
//    }
//
//    private func verifyOTP() {
//        let otp = otpFields.joined()
//        isVerifying = true
//        errorMessage = nil
//
//        let url = URL(string: "https://ridevilla.in/api/V2/Restapi/verifyMobileOtp")!
//        var request = URLRequest(url: url)
//        request.httpMethod = "POST"
//        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
//
//        let body: [String: Any] = [
//            "userId": userId,
//            "code": otp
//        ]
//
//        do {
//            request.httpBody = try JSONSerialization.data(withJSONObject: body)
//        } catch {
//            errorMessage = "Failed to create request body."
//            isVerifying = false
//            return
//        }
//
//        URLSession.shared.dataTask(with: request) { data, response, error in
//            DispatchQueue.main.async {
//                isVerifying = false
//
//                if let error = error {
//                    errorMessage = "Network Error: \(error.localizedDescription)"
//                    return
//                }
//
//                guard let data = data,
//                      let httpResponse = response as? HTTPURLResponse,
//                      httpResponse.statusCode == 200 else {
//                    errorMessage = "Verification failed. Please try again."
//                    return
//                }
//
//                do {
//                    let responseJSON = try JSONSerialization.jsonObject(with: data, options: [])
//                    print("Verification Success: \(responseJSON)")
//                    navigateToVehicleBooking = true // Navigate on success
//                } catch {
//                    errorMessage = "Invalid response from server."
//                }
//            }
//        }.resume()
//    }
//
//    private func resendCode() {
//        isResending = true
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            isResending = false
//            print("OTP Resent!")
//        }
//    }
//}
//
//
////struct LuxuriousOTPVerificationView_Previews: PreviewProvider {
////    static var previews: some View {
////        LuxuriousOTPVerificationView()
////    }
////}
