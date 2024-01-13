//
//  HabitDetailViewModel.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 13/01/24.
//

import Foundation

class HabitDetailViewModel: ObservableObject {

    @Published var habitDescription: String = ""
    @Published var habit: Habit
    
    init(habit: Habit) {
        self.habit = habit
    }
    
}

//MARK: - Habit operations
extension HabitDetailViewModel {
        
    func setUpDescription() {
        habitDescription = RealmManager.shared.getHabitById(id: habit.id)?.habitDescription ?? ""
    }
    
    func updateDescription() {
        RealmManager.shared.updateHabitDescription(id: habit.id , description: habitDescription)
    }

}
