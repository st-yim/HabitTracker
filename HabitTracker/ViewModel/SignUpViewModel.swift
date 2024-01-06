//
//  SignUpViewModel.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 06/01/24.
//

import Foundation

class SignUpViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var confirmPassword = ""
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    func signUpPress() {
        
        if password.isEmpty || email.isEmpty || confirmPassword.isEmpty {
            errorMessage = "Please enter all the details"
        } else if password != confirmPassword {
            errorMessage = "Password and confirm password does not match"
        }
    }
    
}
