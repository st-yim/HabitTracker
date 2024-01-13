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
    
    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    HabitListView(habits: $viewModel.activeHabits, onDeleteHabit: { habit in
                        viewModel.deleteHabit(habit)
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
                        viewModel.deleteHabit(habit)
                    }, onActiveInactiveHabit: { habit in
                        viewModel.toggleActiveInactive(habit)
                    })
                    .tabItem {
                        Image(systemName: "stop.fill")
                        Text("Inactive")
                    }
                }
                Spacer()
                
                HStack {
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
//                        viewModel.clearHabits()
                    }) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    }
                    
                    Spacer()
                    
                    // Signout Button
                    Button(action: {
                        AuthManager.shared.signout()
                    }) {
                        Image(systemName: "rectangle.portrait.and.arrow.forward")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 30, height: 30)
                            .foregroundColor(.red)
                            .padding()
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
