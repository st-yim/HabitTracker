//
//  RealmHabitModel.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 08/01/24.
//

import Foundation
import RealmSwift

class RealmHabitModel: Object {
    @objc dynamic var id = UUID() // Convert UUID to String for Realm
    @objc dynamic var imageName: String = ""
    @objc dynamic var title: String = ""
    @objc dynamic var isSelected: Bool = false
    @objc dynamic var isActive: Bool = true
    @objc dynamic var habitDescription: String = ""

    override static func primaryKey() -> String? {
        return "id"
    }

    // Additional methods or initializers if needed
}

// Extension to convert RealmHabit to Habit
extension RealmHabitModel {
    func toHabit() -> Habit {
        return Habit(id: self.id,
                     imageName: self.imageName,
                     title: self.title,
                     isSelected: self.isSelected,
                     isActive: self.isActive,
                     habitDescription: self.habitDescription)
    }
}

// Extension to convert Habit to RealmHabit
extension RealmHabitModel {
    convenience init(habit: Habit) {
        self.init()
        self.id = habit.id
        self.imageName = habit.imageName
        self.title = habit.title
        self.isSelected = habit.isSelected
        self.isActive = habit.isActive
        self.habitDescription = habit.habitDescription
    }
}
