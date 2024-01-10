//
//  ContentView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showingAddHabitView = false
    @ObservedObject var viewModel = HabitTrackerViewModel()
    
    var activeHabits: [Habit] {
       viewModel.habits.filter { $0.isActive }
    }

    var inactiveHabits: [Habit] {
       viewModel.habits.filter { !$0.isActive }
    }

    var body: some View {
        NavigationView {
            VStack {
                TabView {
                    HabitListView(title: "Active", habits: activeHabits)
                        .tabItem {
                            Image(systemName: "bolt.fill")
                            Text("Active")
                        }

                    HabitListView(title: "Inactive", habits: inactiveHabits)
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
                        viewModel.clearHabits()
                    }) {
                        Image(systemName: "arrow.counterclockwise.circle.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 50, height: 50)
                            .foregroundColor(.blue)
                    }

                    Spacer()
                }
                .padding()
            }
            .navigationBarTitle("Habit Tracker")
            .padding()
            .sheet(isPresented: $showingAddHabitView) {
                NavigationView {
                    AddHabitView(isPresented: $showingAddHabitView, viewModel: viewModel)
                }
            }
        }
        .background(Color.gray.opacity(0.1)) // Optional background color for better visibility
    }
}

#Preview {
    ContentView()
}
