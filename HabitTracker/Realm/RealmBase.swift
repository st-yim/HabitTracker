//
//  RealmBase.swift
//  HabitTracker
//
//  Created by Purvesh Dodiya on 08/01/24.
//

import RealmSwift
import Foundation

// MARK: - Singleton Realm Base class
public class RealmBase {
    // MARK: - Variables
    private let realmObj: Realm?
    
    // MARK: - Initializer
    init() {
        do {
            let config = Realm.Configuration(
                // Set the new schema version. This must be greater than the previously used
                // version (if you've never set a schema version before, the version is 0).
                schemaVersion: 1,
                migrationBlock: { _, oldSchemaVersion in
                    if oldSchemaVersion < 1 {
                        // Nothing to do! Realm will automatically detect new properties and deleted properties
                    }
                }
            )
            Realm.Configuration.defaultConfiguration = config
            self.realmObj = try Realm()
        } catch {
            print("Realm failed in init")
            self.realmObj = nil
        }
    }
}

// MARK: - Database operations
extension RealmBase {
    public func fetch<T: Object>(object: T.Type) -> Results<T>? {
        return realmObj?.objects(T.self)
    }

    func fetchById<T: Object>(data: T.Type, id: UUID) -> T? {
        return realmObj?.object(ofType: data, forPrimaryKey: id)
    }

    public func save<T: Object>(object: T) {
        realmObj?.writeAsync { [weak self] in
            self?.realmObj?.add(object)
        }
    }
    
    public func delete<T: Object>(object: T) {
        realmObj?.writeAsync { [weak self] in
            self?.realmObj?.delete(object)
        }
    }
    
    public func deleteAll() {
        realmObj?.writeAsync {
            self.realmObj?.deleteAll()
        }
    }
    
    public func deleteRealmObjectResult<T: Object>(object: Results<T>) {
        realmObj?.writeAsync({ [weak self] in
            self?.realmObj?.delete(object)
        })
    }
    
    public func create<T: Object>(object: T.Type, values: [String: String]) {
        realmObj?.writeAsync({ [weak self] in
            self?.realmObj?.create(T.self, value: values)
        })
    }
    
    public func add<T: Object>(object: T) {
        realmObj?.writeAsync({ [weak self] in
            self?.realmObj?.add(object)
        })
    }
}
