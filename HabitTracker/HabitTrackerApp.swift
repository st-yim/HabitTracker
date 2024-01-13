//
//  HabitTrackerApp.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI
import FirebaseCore
import FirebaseDatabaseInternal

@main
struct HabitTrackerApp: App {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
    @ObservedObject var authManager = AuthManager.shared
    
    var body: some Scene {
        WindowGroup {
            if authManager.isLoggedIn {
                ContentView()
            } else {
                NavigationView {
                    LoginView()
                }
            }
        }
    }
}

class AppDelegate: NSObject, UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        Database.database().isPersistenceEnabled = true
        AuthManager.shared.checkAuthenticationStatus()
        return true
    }
}
