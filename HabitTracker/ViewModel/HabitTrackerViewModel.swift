//
//  HabitTrackerViewModel.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import Combine
import SwiftUI

class HabitTrackerViewModel: ObservableObject {
    @Published var habits: [Habit] = []
    
    func addHabit(title: String, imageName: String) {
        let newHabit = Habit(imageName: imageName, title: title, isSelected: true)
        habits.append(newHabit)
    }
    
    func deleteHabit(_ habit: Habit) {
        if let index = habits.firstIndex(where: { $0.id == habit.id }) {
            habits.remove(at: index)
        }
    }
    
    func clearHabits() {
        habits.removeAll()
    }
}
