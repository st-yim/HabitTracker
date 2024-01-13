//
//  HabitTrackerViewModel.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import Combine
import SwiftUI

class HabitTrackerViewModel: ObservableObject {

    @Published var activeHabits: [Habit] = []
    @Published var inactiveHabits: [Habit] = []
    
}

//MARK: - Habit operations
extension HabitTrackerViewModel {
    
    func addHabit(title: String, imageName: String) {
        let newHabit = Habit(id: UUID() , imageName: imageName, title: title, isSelected: true)
        RealmManager.shared.storeHabitToRealm(habit: newHabit)
        updateList()
    }
    
    func deleteHabit(_ habit: Habit) {
        RealmManager.shared.deleteHabitById(id: habit.id)
        updateList()
    }
    
    func updateList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5, execute: {
            let habits = RealmManager.shared.getHabitsFromRealm()
            self.activeHabits = habits.filter { $0.isActive }
            self.inactiveHabits = habits.filter { !$0.isActive }
            self.objectWillChange.send()
        })
        
    }
}
