//
//  UserDefaultsManager.swift
//  SomosMasApp
//
//  Created by Santiago Caraballo on 14/02/2022.
//

import Foundation
import UIKit

final class UserDefaultsManager {
    
    static let sharedInstance = UserDefaultsManager()
    let userDefaults = UserDefaults.standard
    
    //Login
    func setLoggedUser() {
        userDefaults.set(true, forKey: UserDefaultsKeys.LoggedUser)
    }
    
    func setLoginType(loginType: LoginType) {
        userDefaults.set(loginType.rawValue, forKey: UserDefaultsKeys.LoginType)
        print(loginType)
    }
    
    func getLoginType() -> LoginType? {
        var data: LoginType?
        if let LoginTypeRawValue = userDefaults.object(forKey: UserDefaultsKeys.LoginType) as? String {
            data = LoginType(rawValue: LoginTypeRawValue)
        }
        return data
    }
}
