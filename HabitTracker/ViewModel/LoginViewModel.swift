//
//  LoginViewModel.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 06/01/24.
//

import Foundation
import FirebaseAuth

class LoginViewModel: ObservableObject {
    
    @Published var email = ""
    @Published var password = ""
    @Published var isLoading = false
    @Published var errorMessage: String?
    @Published var isLoggedIn: Bool = false
    
    init() {
        checkAuthenticationStatus()
    }
    
    func loginPress() {
        isLoading = true
        Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
            guard let self else { return }
            self.isLoading = false
            if let error {
                errorMessage = error.localizedDescription
                return
            }
            if let user = authResult?.user {
                // Login success
                AuthManager.shared.isLoggedIn = true
            }
        }
    }
    
    func checkAuthenticationStatus() {
        Auth.auth().addStateDidChangeListener { _, user in
            self.isLoggedIn = user != nil
        }
    }
}
