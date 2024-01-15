//
//  HabitTrackerViewModel.swift
//  HabitTracker
//
//  Created by Steven Yim on 1/4/24.
//

import Combine
import SwiftUI
<<<<<<< HEAD

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
=======
import FirebaseAuth
import FirebaseDatabaseInternal

class HabitTrackerViewModel: ObservableObject {

    @Published var activeHabits: [Habit] = []
    @Published var inactiveHabits: [Habit] = []
    @Published var userName: String = "User"
    
    init() {
        fetchUserName()
    }
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
    
    func toggleActiveInactive(_ habit: Habit) {
        RealmManager.shared.updateHabitIsActive(id: habit.id, isActive: !habit.isActive)
        updateList()
    }
    
    func updateList() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.1, execute: {
            let habits = RealmManager.shared.getHabitsFromRealm()
            withAnimation {
                self.activeHabits = habits.filter { $0.isActive }
                self.inactiveHabits = habits.filter { !$0.isActive }
            }
        })
        
    }
    
    func clearAllHabit() {
        RealmManager.shared.deleteAll()
        updateList()
    }
}

//MARK: - Firebase operations
extension HabitTrackerViewModel {
    
    func fetchUserName() {
        guard let userId = Auth.auth().currentUser?.uid else {
            return
        }
        
        Database.database().reference().child("users").child(userId).observeSingleEvent(of: .value) { snapshot, _  in
            if let userData = snapshot.value as? [String: Any],
               let fetchedUserName = userData["userName"] as? String {
                self.userName = fetchedUserName
            } else {
                self.userName = "User"
            }
        }
>>>>>>> develop
    }
}
