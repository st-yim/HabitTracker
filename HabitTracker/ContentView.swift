//
//  ContentView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI

struct ContentView: View {
    
    @State private var showingAddHabitView = false
    @StateObject var viewModel = HabitTrackerViewModel()
    @State private var showClearAllAlert = false
    @State private var showDeletHabitAlert = false
    @State private var showLogoutHabitAlert = false
    @State private var showDeleteAccountAlert = false
    @State private var habitToDelete: Habit = Habit(id: UUID(), imageName: "", title: "", isSelected: false)
    
    var body: some View {
        NavigationView {
            VStack(alignment: .leading) {
                Text("Hi \(viewModel.userName)")
                    .font(.headline)
                
                TabView {
                    HabitListView(habits: $viewModel.activeHabits, onDeleteHabit: { habit in
                        habitToDelete = habit
                        showDeletHabitAlert = true
                    }, onActiveInactiveHabit: { habit in
                        viewModel.toggleActiveInactive(habit)
                    })
                    .font(.custom("Helvetica Neue", size: 20))
                    .onAppear(perform: {
                        viewModel.updateList()
                    })
                    .tabItem {
                        Image(systemName: "bolt.fill")
                        Text("Active")
                    }
                    
                    HabitListView(habits: $viewModel.inactiveHabits, onDeleteHabit: { habit in
                        habitToDelete = habit
                        showDeletHabitAlert = true
                    }, onActiveInactiveHabit: { habit in
                        viewModel.toggleActiveInactive(habit)
                    })
                    .tabItem {
                        Image(systemName: "stop.fill")
                        Text("Inactive")
                    }
                }
                .alert(isPresented: $showDeletHabitAlert) {
                    Alert(
                        title: Text("Delete Habit"),
                        message: Text("Are you sure you want to delete this habit?"),
                        primaryButton: .destructive(Text("Delete")) {
                            viewModel.deleteHabit(habitToDelete)
                        },
                        secondaryButton: .cancel(Text("Cancel"))
                    )
                }
                Spacer()
                
                HStack {
                    // Account Deletion Button
                    Button(action: {
                        showDeleteAccountAlert = true
                    }) {
                        Image(systemName: "person.badge.minus")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                            .padding()
                    }
                    .alert(isPresented: $showDeleteAccountAlert) {
                        Alert(
                            title: Text("Delete Account"),
                            message: Text("Are you sure you want to delete your account?"),
                            primaryButton: .destructive(Text("Delete")) {
                                Task {
                                    do {
                                        try await AuthManager.shared.deleteAccount()
                                    } catch {
                                        print("Error deleting account: \(error)")
                                    }
                                }
                            },
                            secondaryButton: .cancel(Text("Cancel"))
                        )
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showingAddHabitView.toggle()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.green)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        showClearAllAlert = true
                    }) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    }
                    
                    .alert(isPresented: $showClearAllAlert) {
                        Alert(
                            title: Text("Clear All Habits"),
                            message: Text("Are you sure you want to clear all habits?"),
                            primaryButton: .destructive(Text("Clear")) {
                                viewModel.clearAllHabit()
                            },
                            secondaryButton: .cancel(Text("Cancel"))
                        )
                    }
                    
                    Spacer()
                    
                    // Signout Button
                    Button(action: {
                        showLogoutHabitAlert = true
                    }) {
                        Image(systemName: "rectangle.portrait.and.arrow.right")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                            .padding()
                    }
                    .alert(isPresented: $showLogoutHabitAlert) {
                        Alert(
                            title: Text("Logout"),
                            message: Text("Are you sure you want to logout?"),
                            primaryButton: .destructive(Text("Logout")) {
                                AuthManager.shared.signout()
                            },
                            secondaryButton: .cancel(Text("Cancel"))
                        )
                    }
                    
                }
                .padding(.horizontal)
            }
            .navigationBarTitle("Habit Tracker")
            .padding()
            .frame(maxWidth: .infinity)
            .background(Color.gray.opacity(0.1)) // Optional background color for better visibility
            .sheet(isPresented: $showingAddHabitView) {
                NavigationView {
                    AddHabitView() {
                        showingAddHabitView = false
                        viewModel.updateList()
                    }
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
