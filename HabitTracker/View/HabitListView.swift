//
//  HabitListItemView.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import SwiftUI

struct HabitListView: View {
    let title: String
    let habits: [Habit]
    @ObservedObject var viewModel = HabitTrackerViewModel()

    var body: some View {
        List {
            ForEach(habits) { habit in
                NavigationLink(destination: HabitDetailView(habit: habit)) {
                    HabitRowView(habit: habit)
                }
            }
        }
        .background(.gray.opacity(0.1))
        .font(.custom("Helvetica Neue", size: 20))
    }
}
