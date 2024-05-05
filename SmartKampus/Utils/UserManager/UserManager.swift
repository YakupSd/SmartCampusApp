//
//  UserManager.swift
//  SmartCampusApp
//
//  Created by Yakup Suda on 18.04.2024.
//

import Foundation

public class UserManager {
    private init() {}
    
    public static let shared = UserManager()
    
    //    MARK: - UserVariables
    var localStorage = LocalStorage()
   
}

//  MARK: - LocalStorages
extension UserManager {
    //    MARK: - FirstLaunch
    func setHasItLaunchedEver() {
        let launchedBefore = localStorage.getBool(key: LocalStorageConstants.KEY_HAS_IT_LAUNCHED_EVER_FLAG)
        if !launchedBefore {
            localStorage.storeBool(key: LocalStorageConstants.KEY_HAS_IT_LAUNCHED_EVER_FLAG, value: true)
            localStorage.sync()
        }
    }
    
    func getHasItLaunchedEver() -> Bool {
        let launchedBefore = localStorage.getBool(key: LocalStorageConstants.KEY_HAS_IT_LAUNCHED_EVER_FLAG)
        return launchedBefore
    }
    
    //    MARK: - Onboarding
    func isOnboarding() -> Bool {
        let isOnboarding = !localStorage.getBool(key: LocalStorageConstants.KEY_ONBOARDING)
        return isOnboarding
    }
    
    func setIsOnboarding() {
        localStorage.storeBool(key: LocalStorageConstants.KEY_ONBOARDING, value: true)
        localStorage.sync()
    }
    
    func isLogin() -> Bool {
        let isLogin = localStorage.getBool(key: LocalStorageConstants.KEY_LOGIN)
        return isLogin
    }
    
    func setIsLogin() {
        localStorage.storeBool(key: LocalStorageConstants.KEY_LOGIN, value: true)
        localStorage.sync()
    }
    
    func setIsLogout() {
        localStorage.storeBool(key: LocalStorageConstants.KEY_LOGIN, value: false)
        localStorage.sync()
    }
    
}

