//
//  HabitListItemView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI

struct HabitListView: View {
<<<<<<< HEAD
    let title: String
    let habits: [Habit]
    @ObservedObject var viewModel = HabitTrackerViewModel()

    var body: some View {
        NavigationView {
            List {
                ForEach(habits) { habit in
                    NavigationLink(destination: HabitDetailView(habit: habit)) {
                        HabitRowView(habit: habit)
                    }
                }
            }
            .navigationBarTitle(title)
            .navigationBarTitleDisplayMode(.inline)
            .font(.custom("Helvetica Neue", size: 20))
        }
=======
    @Binding var habits: [Habit]
    let onDeleteHabit: (Habit) -> Void
    let onActiveInactiveHabit: (Habit) -> Void

    var body: some View {
        VStack {
            if habits.count == 0 {
                Text("No habits found")
                    .font(.title)
            } else {
                ScrollView {
                    ForEach(habits) { habit in
                        VStack {
                            NavigationLink(destination: HabitDetailView(viewModel: .init(habit: habit))) {
                                HabitRowView(habit: habit, onDeleteHabit: onDeleteHabit, onActiveInactiveHabit: onActiveInactiveHabit)
                            }
                        }
                        .padding(12)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .inset(by: 1) // inset value should be same as lineWidth in .stroke
                                .stroke(.gray, lineWidth: 1)
                        )
                        .padding(.horizontal, 8)
                    }
                }
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.gray.opacity(0.1))
>>>>>>> develop
    }
}
