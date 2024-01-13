//
//  RealmBase.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 08/01/24.
//

import RealmSwift
import Foundation

class RealmManager {
    // MARK: - Variables
    static let shared = RealmManager()
    private var realmBase = RealmBase()
}

// MARK: - Functions
extension RealmManager {
    func storeDataToRealm<T: Object>(object: T) {
        realmBase.save(object: object)
    }
    
    func getDataFromRealm<T: Object>(type: T.Type) -> Results<T>? {
        return realmBase.fetch(object: type)
    }
    
    func deleteAll() {
        realmBase.deleteAll()
    }
    
    func deleteDataById<T: Object>(type: T.Type, id: UUID) {
        if let deleteObject = realmBase.fetchById(data: type, id: id), !deleteObject.isInvalidated {
            realmBase.delete(object: deleteObject)
        }
    }
    
    func deleteRealmObjectResult<T: Object>(object: Results<T>) {
        realmBase.deleteRealmObjectResult(object: object)
    }

    func deleteDataFromRealm<T: Object>(object: T) {
        realmBase.delete(object: object)
    }

    func createObjectInRealm<T: Object>(type: T.Type, values: [String: String]) {
        realmBase.create(object: type, values: values)
    }
    
    func addObject<T: Object>(type: T) {
        realmBase.add(object: type)
    }
}

// Habit operation
extension RealmManager {
    // Store Habit object in Realm
    func storeHabitToRealm(habit: Habit) {
        let realmHabit = RealmHabitModel(habit: habit)
        storeDataToRealm(object: realmHabit)
    }
    
    // Retrieve Habits from Realm
    func getHabitsFromRealm() -> [Habit] {
        if let array = getDataFromRealm(type: RealmHabitModel.self) {
            return array.map { $0.toHabit() }
        } else {
            return []
        }
    }

    // Delete all Habits from Realm
    func deleteAllHabits() {
        deleteAll()
    }

    // Delete Habit by ID from Realm
    func deleteHabitById(id: UUID) {
        deleteDataById(type: RealmHabitModel.self, id: id)
    }

}
