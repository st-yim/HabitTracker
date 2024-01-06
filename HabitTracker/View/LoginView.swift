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
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
