//
//  SignUpViewModel.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 06/01/24.
//

import Foundation
import FirebaseAuth
import FirebaseDatabaseInternal

class SignUpViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var userName = ""
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
        isLoading = true
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self else { return }
            self.isLoading = false
            if let error {
                errorMessage = error.localizedDescription
                return
            }
            if let user = authResult?.user {
                let userData = ["userName": self.userName]
                Database.database().reference().child("users").child(user.uid).setValue(userData) { (error, ref) in
                    if let error = error {
                        self.errorMessage = error.localizedDescription
                        return
                    }
                    
                    // Set isLoggedIn to true after successful sign-up and data storage
                    AuthManager.shared.isLoggedIn = true
                }
            }
        }
    }
    
}
