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
    }
}
