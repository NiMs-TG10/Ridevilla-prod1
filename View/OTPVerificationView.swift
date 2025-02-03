//import SwiftUI
//
//struct OTPVerificationView: View {
//    @State private var otpFields: [String] = Array(repeating: "", count: 4)
//    @FocusState private var focusedField: Int?
//    @State private var isResending: Bool = false
//    @State private var isVerifying: Bool = false
//    @State private var errorMessage: String?
//
//    var body: some View {
//        ZStack {
//            // Background Gradient
//            LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]),
//                           startPoint: .topLeading,
//                           endPoint: .bottomTrailing)
//                .ignoresSafeArea()
//            
//            VStack(spacing: 30) {
//                // Title
//                Text("Verify OTP")
//                    .font(.system(size: 28, weight: .bold, design: .rounded))
//                    .foregroundColor(.white)
//                    .padding(.top, 40)
//
//                // Subtitle
//                Text("Code has been sent to +91 9313449825 ")
//                    .font(.system(size: 16, weight: .medium))
//                    .foregroundColor(Color.white.opacity(0.8))
//
//                // OTP Input Boxes with smooth animations
//                HStack(spacing: 15) {
//                    ForEach(0..<4, id: \.self) { index in
//                        ZStack {
//                            if otpFields[index].isEmpty {
//                                RoundedRectangle(cornerRadius: 10)
//                                    .fill(Color.white.opacity(0.1))
//                                    .frame(width: 60, height: 60)
//                            }
//                            TextField("", text: $otpFields[index])
//                                .textContentType(.oneTimeCode)
//                                .keyboardType(.numberPad)
//                                .focused($focusedField, equals: index)
//                                .multilineTextAlignment(.center)
//                                .font(.system(size: 24, weight: .bold))
//                                .foregroundColor(.white)
//                                .onChange(of: otpFields[index]) { _ in
//                                    handleOTPInput(at: index)
//                                }
//                                .frame(width: 60, height: 60)
//                        }
//                        .background(
//                            RoundedRectangle(cornerRadius: 10)
//                                .stroke(Color.white.opacity(focusedField == index ? 1 : 0.2), lineWidth: 2)
//                        )
//                        .animation(.easeInOut(duration: 0.2), value: focusedField)
//                    }
//                }
//
//                // Resend Code Button
//                if isResending {
//                    ProgressView()
//                        .tint(.white)
//                } else {
//                    Button(action: resendCode) {
//                        Text("Didn't get OTP Code? Resend Code")
//                            .font(.system(size: 14, weight: .medium))
//                            .foregroundColor(.white)
//                            .underline()
//                    }
//                }
//
//                // Verify Button with loading animation
//                Button(action: verifyOTP) {
//                    ZStack {
//                        if isVerifying {
//                            ProgressView()
//                                .tint(.white)
//                        } else {
//                            Text("Verify")
//                                .font(.headline)
//                                .foregroundColor(.white)
//                                .padding()
//                                .frame(maxWidth: .infinity)
//                        }
//                    }
//                }
//                .padding()
//                .background(isOTPValid() ? Color.purple : Color.gray.opacity(0.5))
//                .cornerRadius(12)
//                .disabled(!isOTPValid())
//
//                // Error Message
//                if let errorMessage = errorMessage {
//                    Text(errorMessage)
//                        .foregroundColor(.red)
//                        .font(.caption)
//                        .multilineTextAlignment(.center)
//                        .padding(.top, 10)
//                }
//                
//                Spacer()
//            }
//            .padding(.horizontal, 20)
//        }
//        .onAppear {
//            focusedField = 0
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
//        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
//            isVerifying = false
//            if otp == "1234" { // Mock success condition
//                print("OTP Verified!")
//            } else {
//                errorMessage = "Invalid OTP. Please try again."
//                withAnimation {
//                    focusedField = 0 // Reset focus
//                    otpFields = Array(repeating: "", count: 4) // Clear fields
//                }
//            }
//        }
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
//struct LuxuriousOTPVerificationView_Previews: PreviewProvider {
//    static var previews: some View {
//        OTPVerificationView()
//    }
//}
import SwiftUI

struct OTPVerificationView: View {
    @State private var otpFields: [String] = Array(repeating: "", count: 4)
    @FocusState private var focusedField: Int?
    @State private var isResending: Bool = false
    @State private var isVerifying: Bool = false
    @State private var errorMessage: String?
    @State private var navigateToHome: Bool = false // State for navigation

    var body: some View {
        NavigationStack {
            ZStack {
                // Background Gradient
                LinearGradient(gradient: Gradient(colors: [Color.blue.opacity(0.5), Color.purple.opacity(0.5)]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing)
                    .ignoresSafeArea()

                VStack(spacing: 30) {
                    // Title
                    Text("Verify OTP")
                        .font(.system(size: 28, weight: .bold, design: .rounded))
                        .foregroundColor(.white)
                        .padding(.top, 40)

                    // Subtitle
                    Text("Code has been sent to +91 9313449825 ")
                        .font(.system(size: 16, weight: .medium))
                        .foregroundColor(Color.white.opacity(0.8))

                    // OTP Input Boxes with smooth animations
                    HStack(spacing: 15) {
                        ForEach(0..<4, id: \.self) { index in
                            ZStack {
                                if otpFields[index].isEmpty {
                                    RoundedRectangle(cornerRadius: 10)
                                        .fill(Color.white.opacity(0.1))
                                        .frame(width: 60, height: 60)
                                }
                                TextField("", text: $otpFields[index])
                                    .textContentType(.oneTimeCode)
                                    .keyboardType(.numberPad)
                                    .focused($focusedField, equals: index)
                                    .multilineTextAlignment(.center)
                                    .font(.system(size: 24, weight: .bold))
                                    .foregroundColor(.white)
                                    .onChange(of: otpFields[index]) { 
                                        handleOTPInput(at: index)
                                    }
                                    .frame(width: 60, height: 60)
                            }
                            .background(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.white.opacity(focusedField == index ? 1 : 0.2), lineWidth: 2)
                            )
                            .animation(.easeInOut(duration: 0.2), value: focusedField)
                        }
                    }

                    // Resend Code Button
                    if isResending {
                        ProgressView()
                            .tint(.white)
                    } else {
                        Button(action: resendCode) {
                            Text("Didn't get OTP Code? Resend Code")
                                .font(.system(size: 14, weight: .medium))
                                .foregroundColor(.white)
                                .underline()
                        }
                    }

                    // Verify Button with loading animation
                    Button(action: verifyOTP) {
                        ZStack {
                            if isVerifying {
                                ProgressView()
                                    .tint(.white)
                            } else {
                                Text("Verify")
                                    .font(.headline)
                                    .foregroundColor(.white)
                                    .padding()
                                    .frame(maxWidth: .infinity)
                            }
                        }
                    }
                    .padding()
                    .background(isOTPValid() ? Color.purple : Color.gray.opacity(0.5))
                    .cornerRadius(12)
                    .disabled(!isOTPValid())

                    // Error Message
                    if let errorMessage = errorMessage {
                        Text(errorMessage)
                            .foregroundColor(.red)
                            .font(.caption)
                            .multilineTextAlignment(.center)
                            .padding(.top, 10)
                    }

                    Spacer()
                }
                .padding(.horizontal, 20)
            }
            .onAppear {
                focusedField = 0
            }
            // Navigation destination for HomeView
            .navigationDestination(isPresented: $navigateToHome) {
                HomeView()
            }
        }
    }

    // MARK: - Helper Functions
    private func isOTPValid() -> Bool {
        otpFields.allSatisfy { $0.count == 1 }
    }

    private func handleOTPInput(at index: Int) {
        if otpFields[index].count > 1 {
            otpFields[index] = String(otpFields[index].prefix(1))
        }
        if !otpFields[index].isEmpty && index < otpFields.count - 1 {
            focusedField = index + 1
        } else if otpFields[index].isEmpty && index > 0 {
            focusedField = index - 1
        }
    }

    private func verifyOTP() {
        let otp = otpFields.joined()
        isVerifying = true
        errorMessage = nil

        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isVerifying = false
            if otp == "1234" { // Mock success condition
                navigateToHome = true // Navigate to HomeView
            } else {
                errorMessage = "Invalid OTP. Please try again."
                withAnimation {
                    focusedField = 0 // Reset focus
                    otpFields = Array(repeating: "", count: 4) // Clear fields
                }
            }
        }
    }

    private func resendCode() {
        isResending = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            isResending = false
            print("OTP Resent!")
        }
    }
}

// Mock HomeView
struct HomeView: View {
    var body: some View {
        Text("Welcome to Home!")
            .font(.largeTitle)
            .padding()
    }
}

struct OTPVerificationView_Previews: PreviewProvider {
    static var previews: some View {
        OTPVerificationView()
    }
}
