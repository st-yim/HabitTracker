//
//  HabitListItemView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI

struct HabitListView: View {
    @Binding var habits: [Habit]
    let onDeleteHabit: (Habit) -> Void

    var body: some View {
        List {
            ForEach($habits) { habit in
                NavigationLink(destination: HabitDetailView(description: habit.description.wrappedValue)) {
                    HabitRowView(habit: habit, onDeleteHabit: onDeleteHabit)
                }
                .listRowBackground(Color.clear)
            }
        }
        .background(.gray.opacity(0.1))
        .font(.custom("Helvetica Neue", size: 20))
    }
}
