//
//  LocalStorage.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 18.04.2024.
//

import Foundation

public class LocalStorage {
    //    TODO: int, double, object vs eklenecek
    
    let userDefault = UserDefaults.standard
    
    //    MARK: - Strings
    func storeString(key: String, value: String) {
        userDefault.set(value, forKey: key)
    }
    
    func getString(key: String) -> String? {
        return userDefault.string(forKey: key)
    }
    
    //    MARK: - Bools
    func storeBool(key: String, value: Bool) {
        userDefault.set(value, forKey: key)
    }
    
    func getBool(key: String) -> Bool {
        return userDefault.bool(forKey: key)
    }
    
    //    MARK: - Datas
    func storeData(key: String, value: Data) {
        userDefault.set(value, forKey: key)
    }
    
    func getData(key: String) -> Data? {
        if let data = userDefault.data(forKey: key) {
            return data
        }
        return nil
    }
    
    //    MARK: - Objects
    func storeObject(key: String, value: Any) {
        userDefault.set(value, forKey: key)
    }
    
    func getObject(key: String) -> Any? {
        if let data = userDefault.object(forKey: key) {
            return data as AnyObject
        }
        return nil
    }
    
    func storeLocalizationStructObject(key:String, value: Data) {
        userDefault.set(value, forKey: key)
        
    }
    
    //    MARK: - Date
    func storeDate(key: String, value: Date) {
        userDefault.set(value, forKey: key)
    }
    
    func getDate(key: String) -> Date? {
        if let data = userDefault.object(forKey: key) as? Date {
            return data
        }
        return nil
    }
    
    //    MARK: - Int64
    func storeInt64(key: String, value: Int64) {
        userDefault.set(value, forKey: key)
    }
    
    func getInt64(key: String) -> Int64? {
        if let data = userDefault.object(forKey: key) as? Int64 {
            return data
        }
        return nil
    }
    
    //    MARK: - Generals
    func remove(key: String) {
        userDefault.removeObject(forKey: key)
    }
    
    func sync() {
        UserDefaults.standard.synchronize()
    }
    
    func clear() {
        if let bundleID = Bundle.main.bundleIdentifier {
            UserDefaults.standard.removePersistentDomain(forName: bundleID)
        }
    }
}

