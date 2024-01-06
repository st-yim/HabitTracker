//
//  SignUpView.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 06/01/24.
//

import SwiftUI

struct SignUpView: View {
    
    @StateObject var viewModel: SignUpViewModel = SignUpViewModel()    

    var body: some View {
        VStack {
            Spacer()

            Text("Habit Tracker Sign Up")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            VStack(alignment: .leading, spacing: 16) {

                TextField("Email", text: $viewModel.email)
                    .padding()
                    .keyboardType(.emailAddress)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8.0)

                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8.0)

                SecureField("Confirm Password", text: $viewModel.confirmPassword)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8.0)
            }
            .padding()

            Button(action: {
                viewModel.signUpPress()
            }) {
                Text("Sign Up")
                    .foregroundColor(.white)
                    .padding()
                    .frame(maxWidth: .infinity)
                    .background(Color.green)
                    .cornerRadius(8.0)
            }
            .padding()
            .disabled(viewModel.isLoading)
            .opacity(viewModel.isLoading ? 0.6 : 1)

            Spacer()
        }
        .padding()
        .onTapGesture {
            viewModel.errorMessage = nil
        }
        .overlay(
            // Overlay a view to show the error message
            Group {
                if let errorMessage = viewModel.errorMessage {
                    ErrorView(message: errorMessage, onClose: {
                        // Close the error message when the overlay is tapped
                        viewModel.errorMessage = nil
                    })
                }
            }
        )
    }
}

struct SignUpView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpView()
    }
}
