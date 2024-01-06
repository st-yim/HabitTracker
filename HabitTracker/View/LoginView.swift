//
//  LoginView.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 06/01/24.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: LoginViewModel = LoginViewModel()

    var body: some View {
        
        VStack {
            Spacer()

            Text("Habit Tracker Login")
                .font(.title)
                .fontWeight(.bold)
                .padding()

            VStack(alignment: .leading, spacing: 16) {
                TextField("Email", text: $viewModel.email)
                    .padding()
                    .textContentType(.emailAddress)
                    .keyboardType(.emailAddress)
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8.0)

                SecureField("Password", text: $viewModel.password)
                    .padding()
                    .background(Color.gray.opacity(0.1))
                    .cornerRadius(8.0)
            }
            .padding()

            if viewModel.isLoading {
                           ProgressView("Logging in...")
                               .progressViewStyle(CircularProgressViewStyle())
                               .foregroundColor(.blue)
                               .padding()
            } else {
                Button(action: {
                    viewModel.loginPress()
                }) {
                    Text("Login")
                        .foregroundColor(.white)
                        .padding()
                        .frame(maxWidth: .infinity)
                        .background(Color.blue)
                        .cornerRadius(8.0)
                }
                .padding()
                .disabled(viewModel.isLoading)
                .opacity(viewModel.isLoading ? 0.6 : 1)
            }

            HStack {
                Spacer()
                NavigationLink(destination: SignUpView()) {
                    Text("Sign Up")
                        .foregroundColor(.blue)
                        .padding()
                }
                
            }
            .padding()

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

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
