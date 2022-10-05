//
//  SimpleServiceModel.swift
//  SimpleServiceModel
//
//  Created by Artur Bandaryk on 10/4/22.
//

// MARK: simple class representing service containing password and user name.
// In MVC pattern this class represents 'Model'.

class SimpleServiceModel {
    private let userName = "user"
    private let password = "password"
    
    internal func authorizationSuccess(_ userName: String?,
                                       _ password: String?) -> Bool {
        if userName == nil || password == nil {
            return false
        }
        
        return self.userName == userName! && self.password == password!
    }
}
